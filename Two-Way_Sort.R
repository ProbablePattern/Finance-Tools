require(foreach); require(xtable)
doublesort=function(data,x,y,q) {
 breaks1=quantile(data[,x],probs=seq(0,1,1/q))
 tiles=foreach(i=1:q,.combine=cbind) %dopar% {
 Q=data[data[,x]>=breaks1[i] & data[,x]<breaks1[i+1],y]
 breaks2=quantile(Q,probs=seq(0,1,1/q))
 foreach(j=1:q,.combine=rbind) %dopar% mean(Q[Q>=breaks2[j] & Q<breaks2[j+1]])
 }
 colnames(tiles)=foreach(i=1:q) %do% paste(x,i)
 row.names(tiles)=foreach(i=1:q) %do% paste(y,i)
 tiles
}
xtable(doublesort(data,"CDS","lp",5),digits=4)
