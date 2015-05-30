# mt-qe-eval

Instructions for MT-QE-eval: Significance Test for Evaluation of Quality Estimation
-----------------------------------------------------------------------------------

Contact: graham.yvette@gmail.com

-----------------------------------------------------------------------------------

The following is a description of how to carry out significance tests for an
increase in Pearson correlation of one QE system over a baseline system
described in the following paper:

Yvette Graham. "Improving Evaluation of Machine Translation Quality Estimation", ACL
2015.

Requirements:
--------------------

1. "R Statistical Software"
    - To install R on the command line:
          > sudo apt-get install r-base

2. R's "psych" package

      To install R's "psych" package:
         - IF your institution uses a proxy server, you need to tell R about it BEFORE
           installing any package, here's what to do:
           A) Open your R command line, by typing "R"
           B) Type the following commmand into R, remembering to provide your
              actual credentials and proxy server details:

           > Sys.setenv(http_proxy="http://myusername:mypasssord@myproxyserver.com:8080/")

           IF NOT, continue on below.

         - Open R command line (by typing "R") and enter the following:

           > install.packages("psych")

           You'll be given an option of a CRAN site, when you have one selected, you
           might need to answer "y" to some questions. When "psych" is finished
           installing, type the following to quit R:

            > quit("no")


How to run:
--------------------

Example data is included in the files:

    ./task-1.2.csv # System predictions and human scores (HTER in example data) for sentences;
    ./metrics.12   # Names of metrics you wish to carry out pairewise tests for.

Run pairwise significance tests as follows:

    R --no-save < pearson-sig.R

This creates a file containing a matrix of p-values for system-pairwise tests, for each pair of
systems Williams test is carried out to test significance of the increase in correlation with
human scores of metric A over that of metric B is significant.
