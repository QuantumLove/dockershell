promptValue() {
    local val
    read -p "$1"": " val
    echo $val
}

asess() {
    local TOKEN_DURATION=${1:-900}

    echo "Getting caller identity..."
    local MFA_ARN="$(aws sts get-caller-identity | jq -r '.Arn' | xargs | sed 's/:user\//:mfa\//')"

    local MFA_CODE=$(promptValue "Enter OTP for ${MFA_ARN}")
    local TOKEN_OUTPUT="$(aws sts get-session-token \
        --serial-number "${MFA_ARN}" \
        --duration-seconds $TOKEN_DURATION \
        --token-code "${MFA_CODE}")"

    if [ $(echo "${TOKEN_OUTPUT}" | grep -q Credentials || echo 'failed') ]
    then
        echo "${TOKEN_OUTPUT}"
        return 1
    fi

    source <(echo "${TOKEN_OUTPUT}" \
        | grep -E 'Access|Session' \
        | awk -F '"' '{
            a=gensub(/([A-Z])/,"_\\1","g",$2);
            print "export AWS" toupper(a) "=" $4
        }')

    echo "Session created!"
}

cd /home/files
asess
aws ${@}
bash