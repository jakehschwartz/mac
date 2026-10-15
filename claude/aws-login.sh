#!/bin/bash

LOCKDIR="/tmp/claude_saml2aws.lock"
SAML_PROFILE="Google-PlatformEng"

# Step 1: Check if credentials are still valid
if aws sts --profile $SAML_PROFILE get-caller-identity >/dev/null 2>&1; then
    exit 0
fi

# Step 2: Acquire lock and perform login
if mkdir "$LOCKDIR" 2>/dev/null; then
    trap 'rm -rf "$LOCKDIR"' EXIT

    echo "Refreshing AWS credentials via saml2aws..."
    if saml2aws login --force --skip-prompt; then
        # # OPTIONAL: Sync SAML profile to [default] profile in us-east-1
        # aws configure set aws_access_key_id     "$(aws configure get aws_access_key_id --profile $SAML_PROFILE)"
        # aws configure set aws_secret_access_key "$(aws configure get aws_secret_access_key --profile $SAML_PROFILE)"
        # aws configure set aws_session_token     "$(aws configure get aws_session_token --profile $SAML_PROFILE)"
        # aws configure set region                "us-east-1"
        echo "Refresh successful!"
        exit 0
    fi
    echo "Refresh failed!"
    exit 1
else
    # Step 3: Wait for another session to finish
    while [ -d "$LOCKDIR" ]; do
        sleep 1
    done

    aws sts --profile $SAML_PROFILE get-caller-identity >/dev/null 2>&1 && exit 0
    echo "AWS login failed or timed out in another session."
    exit 1
fi
