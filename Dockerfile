FROM python:2.7

RUN easy_install \
	Trac==1.0.7 \
	https://trac-hacks.org/svn/accountmanagerplugin/tags/acct_mgr-0.4.4 \
        https://trac-hacks.org/svn/customfieldadminplugin/0.11 \
        TracSpamFilter \
	https://software.sandia.gov/svn/public/fast/TicketModerator/tags/0.6.4/
RUN pip install git+git://github.com/dnarvaez/github-trac.git

CMD trac-admin /project upgrade; \
    tracd -s -p 5007 /project
