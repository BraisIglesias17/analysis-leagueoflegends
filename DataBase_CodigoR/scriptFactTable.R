#CREATE FACT TABLE
#Leo archivo de estadisticas
factTable<-read.csv(file = "stats1.csv",sep=",")

#Elimino las columnas que no me interesan
reducedFactTable<-dplyr::select(factTable,-trinket,-item2,-item3,-item4,-item5,-item6,-largestkillingspree,
                                  -largestmultikill,-killingsprees,doublekills,-triplekills,-legendarykills,-
                        largestcrit,-magicdmgtochamp,-physdmgtochamp,-truedmgtochamp,-totunitshealed
                        ,-dmgselfmit,-dmgtoobj,-dmgtoturrets,-timecc,-magicdmgtaken,-physdmgtaken
                        ,-truedmgtaken,-neutralminionskilled,-ownjunglekills,-enemyjunglekills,-totcctimedealt,
                      )

reducedFactTable<-dplyr::select(reducedFactTable,-wardsbought,-wardskilled,-inhibkills)


#Escribo en un archivo de estadisticas reducido por si me interesa en un futuro
write.csv(reducedFactTable,file="stats.csv")

#Leo el archivo que contiene información relativa al jugador
participants<-read.csv(file = "participantsV2.csv",sep=",")

#Hago un merde por id , ambos ids correpsonden al id del jugador
FT<-merge(reducedFactTable,participants,by.x=1,by.y=7)

##tengo que MAPEAR ROLE Y POSITION A SU ID


##Coloco las columnas de ids al principio
matchids<-FT$matchid
championids<-FT$championid
teamids<-FT$teamid
roleids<-FT$role
positionids<-FT$position
itemsid<-FT$item1
winid<-FT$win

FT<-dplyr::select(FT,-X,-matchid,-championid,-teamid,-role,-position,-item1,-win,-firstblood.y)


#Incorporo los ids al principio con el nombre correcto
FT<-cbind(data.frame("ID_GAME"=matchids),FT)
FT<-cbind(data.frame("ID_CHAMPION"=championids),FT)
FT<-cbind(data.frame("ID_TEAM"=teamids),FT)
FT<-cbind(data.frame("ID_ROLE"=roleids),FT)
FT<-cbind(data.frame("ID_POSITION"=positionids),FT)
FT<-cbind(data.frame("ID_ITEM"=itemsid),FT)
FT<-cbind(data.frame("ID_WIN"=winid),FT)

##FT SIZE IS 999999
#Reduzco del set al tamaño de información
FT<-FT[1:100000,]

write.csv(FT,"factTable.csv")


