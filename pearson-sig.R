
# Copyright 2015 Yvette Graham 
# 
# This file is part of MTQEeval.
# 
# SegmentMTeval is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# MTQEeval is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with MTQEeval.  If not, see <http://www.gnu.org/licenses/>

library(psych)

f <- "metrics.12"
metrics <- read.table(f,header=T)
metrics <- metrics$NAMES

f <- "task-1.2.csv"
a <- read.table(f,header=T)

sink("task-1.2-pearson-sig.csv")

for( metric in unique(unlist(metrics))){
  cat(paste("\t",metric))
}
cat(paste("\n"))

for( met1 in unique(unlist(metrics))){
                
    m1 <- a[ which(a$METRIC==met1), ]
    m1 <- m1[order(m1$SID),]
    m1.h <- cor(m1$SCORE,m1$HUMAN)

    cat(paste(met1));

    for( met2 in unique(unlist(metrics))){
            
        p <- "-"
    
        if( met1!=met2){
        
            m2 <- a[ which( a$METRIC==met2), ]
            m2 <- m2[order(m2$SID),]

            m2.h <- cor(m2$SCORE,m2$HUMAN)
            m1.m2 <- cor(m1$SCORE,m2$SCORE)


            if( m1.h > m2.h ){
                p <- r.test( n = length( a$HUMAN), 
		        r12 = m1.h, 
		        r13 = m2.h, 
		        r23 = m1.m2, 
 		        twotailed = FALSE)$p
            }
        }
            
        cat(paste("\t", p));
    }
    cat(paste("\n"));
}

sink()
