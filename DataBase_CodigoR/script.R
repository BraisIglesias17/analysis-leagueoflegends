file<-read.csv(file = "teamstats.csv",sep=",")

fileParticipant<-read.csv(file = "participants.csv",sep=",")
#Elimino columnas sobrantes
file<-dplyr::select(file,c(-5,-6,-7,-8,-10,-11,-12))

#Extraigo los valores únicos de cada columna para cada dimensión

particiPantsComplete<-merge(file,fileParticipant,by.x =1,by.y=2)


#Elimino los que no pertenecen a cada equipo (1-5 equipo 100,6-10 equipo 200)
particiPantsComplete<-particiPantsComplete[(particiPantsComplete$teamid==100&particiPantsComplete$player<=5|
                                              particiPantsComplete$teamid==200&particiPantsComplete$player>5),]




toWrite<-dplyr::select(particiPantsComplete,c(-6,-8,-10,-11))
write.csv(toWrite,file = "participantsV2.csv")
