library(OECD)
library(tidyverse)
library(ggplot2)

df <- get_dataset("LFS_SEXAGE_I_R",
                  filter = list(c("CHE"),"MW",c("1524","2534","3544","4554","5564","1564"),"EPR"))
sel <- df %>%
  filter(FREQ == "A",
         obsTime >= 2000 
         #        MEASURE == "STE"
  ) %>%
  select(obsTime, AGE, obsValue)
sel$AGE[sel$AGE=="1524"] <- "15 - 24 J."
sel$AGE[sel$AGE=="2534"] <- "25 - 34 J."
sel$AGE[sel$AGE=="3544"] <- "35 - 44 J."
sel$AGE[sel$AGE=="4554"] <- "45 - 54 J."
sel$AGE[sel$AGE=="5564"] <- "55 - 64 J."
sel$AGE[sel$AGE=="1564"] <- "15 - 64 J."

ggplot(data=sel, aes(x=as.Date(obsTime,"%Y"), y=obsValue, group=AGE,linetype=AGE)) +
  geom_line(aes(color=AGE),size=0.9) +
  scale_linetype_manual(values =c("solid","twodash","solid","solid","solid","solid"))+
  scale_color_manual(values = c("#8E44AD", "#F8C471","#34495E","#138D75","#E74C3C","#17202A"))+
  labs(#title = "Erwerbslosenrate",
    #subtitle = "Verkaufte Weihnachtsbäume in USA | Quelle: Statista",
    y = "",
    x = "") +
  theme_minimal()+
  theme(legend.position="top",legend.title=element_blank()) + 
  coord_fixed(ratio=150) +  
  theme(text = element_text(size = 15))+
  scale_y_continuous(labels = function(x) paste0(x*1, "%")) 


