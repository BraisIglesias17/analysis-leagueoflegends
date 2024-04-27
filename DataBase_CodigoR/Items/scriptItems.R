file<-jsonlite::fromJSON("item.json")
auxFile<-read.delim("items-IDS.txt",header=FALSE,sep=":")

items<-file$data

names<-list()
gold<-list()
ids<-auxFile$V1

for( register in items){
  names<-c(names,register$name)
  gold<-c(gold,register$gold$total)
}

names<-unlist(names)
gold<-unlist(gold)

df<-data.frame(
  "id" = ids, 
  "name" = names, 
  "gold" = gold
)

write.csv(df,file="items.csv", row.names = F)
