file<-read.csv("matches.csv",sep=",")

aux<-read.csv("items.csv",sep=",")

#NA1,EUN1,TR1,
countTR=0
countEUN=0
for( i in seq(1,nrow(file),1)){
  if(i%%10==0){
    file[i,]$platformid="NA1"
  }
  if(countTR>3000 & countTR<4500){
    file[i,]$platformid="TR1"
    
  }
  if(countEUN>1000 & countEUN<2000){
    file[i,]$platformid="EUN1"
  
  }
  
  countEUN=countEUN+1
  countTR=countTR+1
}



write.csv(file,file = "matchesV2.csv")
