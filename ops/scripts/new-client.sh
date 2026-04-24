#!/usr/bin/env bash
# new-client.sh — one-command client scaffold for Hands Off Design.
#
# Usage:
#   ops/scripts/new-client.sh <slug> [--city "Phoenix"] [--industry "Fencing"] \
#                                   [--phone "(602) 555-0199"] [--business-name "Acme Fencing"]
#                                   [--dry-run] [--force]
#
# - <slug> must be kebab-case (a–z, 0–9, hyphens).
# - Placeholders are replaced in-file: {{CLIENT}}, {{CLIENT_SLUG}}, {{CITY}}, {{INDUSTRY}}, {{PHONE}}.
# - Without a flag we interactively prompt for the missing value.
# - --dry-run prints the plan and makes no changes.
# - --force will overwrite an existing clients/<slug>/ — refuses without it.
#
# Example:
#   ops/scripts/new-client.sh acme-fencing --city "Phoenix" --industry "Fencing" \
#       --phone "(602) 555-0199" --business-name "Acme Fencing"

set -euo pipefail

# -- resolve repo root regardless of cwd -------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TEMPLATE_DIR="$REPO_ROOT/clients/_template"
CLIENTS_DIR="$REPO_ROOT/clients"

# -- parse args --------------------------------------------------------------
SLUG=""
CITY=""
INDUSTRY=""
PHONE=""
BUSINESS_NAME=""
DRY_RUN=0
FORCE=0

die() { printf 'error: %s\n' "$*" >&2; exit 1; }

usage() {
    sed -n '2,18p' "$0"
    exit "${1:-0}"
}

while (( $# )); do
    case "$1" in
        --city) CITY="${2:-}"; shift 2 ;;
        --industry) INDUSTRY="${2:-}"; shift 2 ;;
        --phone) PHONE="${2:-}"; shift 2 ;;
        --business-name) BUSINESS_NAME="${2:-}"; shift 2 ;;
        --dry-run) DRY_RUN=1; shift ;;
        --force) FORCE=1; shift ;;
        -h|--help) usage 0 ;;
        -*) die "unknown flag: $1" ;;
        *)
            if [[ -z "$SLUG" ]]; then SLUG="$1"; shift
            else die "unexpected arg: $1"
            fi ;;
    esac
done

[[ -z "$SLUG" ]] && die "missing <slug>. Run with --help."

# validate slug (kebab-case)
if ! [[ "$SLUG" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    die "slug must be kebab-case (a-z, 0-9, hyphens). got: $SLUG"
fi

# -- verify template exists --------------------------------------------------
[[ -d "$TEMPLATE_DIR" ]] || die "template not found at $TEMPLATE_DIR"

TARGET="$CLIENTS_DIR/$SLUG"
if [[ -e "$TARGET" ]]; then
    if (( FORCE )); then
        printf 'warning: %s exists, overwriting (--force)\n' "$TARGET" >&2
    else
        die "$TARGET already exists. pass --force to overwrite."
    fi
fi

# -- interactively collect anything missing ----------------------------------
prompt_if_empty() {
    local var_name="$1" label="$2" default="${3:-}"
    local current="${!var_name}"
    if [[ -z "$current" ]]; then
        if [[ -n "$default" ]]; then
            read -rp "$label [$default]: " input || true
            printf -v "$var_name" '%s' "${input:-$default}"
        else
            read -rp "$label: " input || true
            printf -v "$var_name" '%s' "$input"
        fi
    fi
}

# default business name = Title-Cased slug
DEFAULT_BIZ="$(printf '%s' "$SLUG" | awk -F- '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1' OFS=' ')"

prompt_if_empty BUSINESS_NAME "Business name" "$DEFAULT_BIZ"
prompt_if_empty CITY          "City"            "Phoenix"
prompt_if_empty INDUSTRY      "Industry"
prompt_if_empty PHONE         "Phone (with formatting)"

# -- print the plan ----------------------------------------------------------
cat <<EOF

Plan:
  slug           : $SLUG
  business name  : $BUSINESS_NAME
  city           : $CITY
  industry       : $INDUSTRY
  phone          : $PHONE
  source         : $TEMPLATE_DIR
  target         : $TARGET
  dry-run        : $DRY_RUN
  force          : $FORCE

EOF

if (( DRY_RUN )); then
    echo "dry-run — no changes made."
    exit 0
fi

# -- do the work, with cleanup on abort --------------------------------------
CREATED_TARGET=0
cleanup() {
    local rc=$?
    if (( rc != 0 )) && (( CREATED_TARGET )); then
        printf 'aborted — removing half-scaffolded %s\n' "$TARGET" >&2
        rm -rf "$TARGET"
    fi
    exit "$rc"
}
trap cleanup ERR INT

# 1. copy template
if (( FORCE )) && [[ -d "$TARGET" ]]; then rm -rf "$TARGET"; fi
cp -R "$TEMPLATE_DIR" "$TARGET"
CREATED_TARGET=1

# 2. in-place placeholder replacement (portable sed: write to tmp, mv back)
replace_in_file() {
    local file="$1"
    local tmp; tmp="$(mktemp)"
    sed \
        -e "s|{{CLIENT}}|$BUSINESS_NAME|g" \
        -e "s|{{CLIENT_SLUG}}|$SLUG|g" \
        -e "s|{{CITY}}|$CITY|g" \
        -e "s|{{INDUSTRY}}|$INDUSTRY|g" \
        -e "s|{{PHONE}}|$PHONE|g" \
        "$file" > "$tmp"
    mv "$tmp" "$file"
}

while IFS= read -r -d '' file; do
    replace_in_file "$file"
done < <(find "$TARGET" -type f \( -name '*.md' -o -name '*.ts' -o -name '*.astro' -o -name '*.json' -o -name '*.html' \) -print0)

# 3. drop kickoff stub in comms/
KICKOFF="$TARGET/comms/kickoff.md"
if [[ ! -f "$KICKOFF" ]]; then
    mkdir -p "$TARGET/comms"
    cat > "$KICKOFF" <<KICKEOF
# $BUSINESS_NAME — Kickoff

- **City:** $CITY
- **Industry:** $INDUSTRY
- **Phone:** $PHONE
- **Scaffolded:** $(date +%Y-%m-%d) via ops/scripts/new-client.sh

## Reply channel
_(e.g. Yelp PM, personal Gmail, phone) — capture here so later messages thread properly._

## Decisions captured so far
-

## Outstanding questions for client
-

## Imagery inventory status
See \`design/handoff.md\` — Matt blocked until all rows green (see \`clients/_template/design/photography-and-imagery-guide.md\`).
KICKEOF
fi

# -- next steps --------------------------------------------------------------
cat <<EOF
Created $TARGET.

Next:
  1. Stevie — pick a wireframe variant from clients/_template/design/fastest-path-wireframe-kit.md.
     Industry "$INDUSTRY" suggests: (Trades | Services | Food | Retail) — Stevie decides.
  2. Add $TARGET/dev/business.ts with NAP fields (see seo-local-business.md).
  3. Populate imagery inventory in design/handoff.md. No dev until inventory is all-green.
  4. Queue Gate 3a once wireframe is ready: add a row to ops/approvals/queue.md.

EOF
