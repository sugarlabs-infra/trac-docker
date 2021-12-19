FROM python:2.7

RUN easy_install \
	Trac==1.0.13 \
        https://trac-hacks.org/svn/customfieldadminplugin/0.11 \
        TracSpamFilter
#	https://software.sandia.gov/svn/public/fast/TicketModerator/tags/0.6.4/ \
#        recaptcha_client
RUN pip install git+git://github.com/scanterog/acct_mgr-0.4.4.git
RUN pip install git+git://github.com/dnarvaez/github-trac.git
#RUN pip install git+git://github.com/scanterog/trac-recaptcharegister.git

CMD trac-admin /project upgrade; \
    tracd -s -p 5007 /project
