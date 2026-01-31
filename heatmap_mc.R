library(ggplot2)
library(reshape2)
library(plyr)
library(scales)
if ( grepl("tsm",commandArgs(TRUE)[2],ignore.case = TRUE)) {
clr <-c("darkblue")
} else if ( grepl("hpss",commandArgs(TRUE)[1],ignore.case = TRUE)) {
clr <-c("darkcyan")
} else if ( grepl("combin",commandArgs(TRUE)[1],ignore.case = TRUE) | grepl("merg",commandArgs(TRUE)[1],ignore.case = TRUE)) {
clr <-c("darkblue")
} else {
clr <-c("darkblue")
}
hm <- read.csv(commandArgs(TRUE)[1])
hm.m <-melt(hm)
# hm.m<-ddply(hm.m, .(variable), transform,rescale = rescale(value))
hm.m<-ddply(hm.m, .(variable), transform,rescale = rescale(value,to = c(-1,1), from =c(-3600,3600)))
p <- ggplot(hm.m, aes(variable, Drive_name)) + geom_tile(aes(fill = rescale),colour = "white") +  scale_fill_gradient2(low = "darkcyan",high = clr,na.value = "grey50")
# p + theme(axis.text.x = element_text(size = rel(0.16), angle = 90)) + theme(axis.text.y = element_text(size = rel(0.16))) + theme(axis.title.x = element_blank())
p + theme(axis.text.x = element_text(size = rel(0.4),angle = 90)) + theme(axis.text.y = element_text(size = rel(1.32))) + theme(axis.title.x = element_blank())
pdf(NULL)
ggsave(file=commandArgs(TRUE)[2],width=40, height=20)
# ggsave(file=commandArgs(TRUE)[2])

