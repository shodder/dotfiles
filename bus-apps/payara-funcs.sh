
function start-payara {
	domain_num=1
	debug=""

	if [[ -z $PAYARA_DOMAINS ]] ; then echo "PAYARA_DOMAINS not set" ; exit 1 ; fi
	if [[ -z $PAYARA_BIN ]] ; then echo "PAYARA_BIN not set" ; exit 1 ; fi

	if [[ $1 ]]; then domain_num=$1 ; fi
	echo "Starting domain: $domain_num"

	if [[ "$2" = "debug" ]]; then echo "Starting with debugging" ; debug="--debug" ; fi

	asadmin=$PAYARA_BIN/asadmin

	sudo $asadmin start-domain $debug --domaindir $PAYARA_DOMAINS "domain"$domain_num
}

function stop-payara {
	domain_num=1

	if [[ -z $PAYARA_DOMAINS ]] ; then echo "PAYARA_DOMAINS not set" ; exit 1 ; fi
	if [[ -z $PAYARA_BIN ]] ; then echo "PAYARA_BIN not set" ; exit 1 ; fi

	if [[ $1 ]]; then domain_num=$1 ; fi
	echo "Starting domain: $domain_num"

	asadmin=$PAYARA_BIN/asadmin

	sudo $asadmin stop-domain --domaindir $PAYARA_DOMAINS "domain"$domain_num
}



