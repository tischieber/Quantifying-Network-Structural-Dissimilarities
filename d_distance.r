library(igraph)
library('Matrix')
#library('MatrixStats')

# Shannon entropy

entropia<-function(a)
{
a<-a[which(a>0)];
-sum(a*log(a));
}


#returns the node distance matrix

node_distance<-function(g){

n<-length(V(g))

if(n==1){

retorno=1

}

if(n>1){

a<-Matrix(0,nrow=n,ncol=n,sparse=TRUE)

m<-shortest.paths(g,algorithm=c("unweighted"))

if(any(is.infinite(m))) m[which(m==Inf)]<-n

quem<-setdiff(intersect(m,m),0)

for(j in (1:length(quem))){

l<-which(m==quem[j])/n

linhas<-floor(l)+1

posicoesm1<-which(l==floor(l))

if(length(posicoesm1)>0){

linhas[posicoesm1]<-linhas[posicoesm1]-1

}


a[1:n,quem[j]]<-hist(linhas,plot=FALSE,breaks=(0:n))$counts

}

#m<-c()

retorno=(a/(n-1))

}

return(retorno)

}


# nnd

nnd<-function(g){

N<-length(V(g))

nd<-node_distance(g)

pdfm<-colMeans(nd)

norm<-log(max(c(2,length(which(pdfm[1:(N-1)]>0))+1)))

return(c(pdfm,max(c(0,entropia(pdfm)-entropia(nd)/N))/norm))


}

#function

alpha<-function(g){

N<-length(V(g))

r<-sort(alpha.centrality(g,exo=degree(g)/(N-1),alpha=1/N))/((N^2))

return(c(r,max(c(0,1-sum(r)))))

}

#function

D<-function(g,h,w1=0.45,w2=0.45,w3=0.1){

first<-0

second<-0

third<-0

# g<-read.graph(g,format=c("edgelist"),directed=FALSE)

# h<-read.graph(h,format=c("edgelist"),directed=FALSE)

N<-length(V(g))

M<-length(V(h))

PM<-matrix(0,ncol=max(c(M,N)))

if(w1+w2>0){

pg=nnd(g)

PM[1:(N-1)]=pg[1:(N-1)]

PM[length(PM)]<-pg[N]

ph=nnd(h)

PM[1:(M-1)]=PM[1:(M-1)]+ph[1:(M-1)]

PM[length(PM)]<-PM[length(PM)]+ph[M]

PM<-PM/2

first<-sqrt(max(c((entropia(PM)-(entropia(pg[1:N])+entropia(ph[1:M]))/2)/log(2),0)))

second<-abs(sqrt(pg[N+1])-sqrt(ph[M+1]))


}

if(w3>0){

pg<-alpha(g)

ph<-alpha(h)

m<-max(c(length(pg),length(ph)))

Pg<-matrix(0,ncol=m)

Ph<-matrix(0,ncol=m)

Pg[(m-length(pg)+1):m]<-pg

Ph[(m-length(ph)+1):m]<-ph

third<-third+sqrt((entropia((Pg+Ph)/2)-(entropia(pg)+entropia(ph))/2)/log(2))/2

g<-graph.complementer(g)

h<-graph.complementer(h)


pg<-alpha(g)

ph<-alpha(h)

m<-max(c(length(pg),length(ph)))

Pg<-matrix(0,ncol=m)

Ph<-matrix(0,ncol=m)

Pg[(m-length(pg)+1):m]<-pg

Ph[(m-length(ph)+1):m]<-ph

third<-third+sqrt((entropia((Pg+Ph)/2)-(entropia(pg)+entropia(ph))/2)/log(2))/2


}

return(w1*first+w2*second+w3*third)


}

#function

d<-function(g,h,w1=0.5,w2=0.5,w3=0){

first<-0

second<-0

third<-0

# g<-read.graph(g,format=c("edgelist"),directed=FALSE)

# h<-read.graph(h,format=c("edgelist"),directed=FALSE)

N<-length(V(g))

M<-length(V(h))

PM<-matrix(0,ncol=max(c(M,N)))

if(w1+w2>0){

pg=nnd(g)

PM[1:(N-1)]=pg[1:(N-1)]

PM[length(PM)]<-pg[N]

ph=nnd(h)

PM[1:(M-1)]=PM[1:(M-1)]+ph[1:(M-1)]

PM[length(PM)]<-PM[length(PM)]+ph[M]

PM<-PM/2

first<-sqrt(max(c((entropia(PM)-(entropia(pg[1:N])+entropia(ph[1:M]))/2)/log(2),0)))

second<-abs(sqrt(pg[N+1])-sqrt(ph[M+1]))


}

if(w3>0){

pg<-alpha(g)

ph<-alpha(h)

m<-max(c(length(pg),length(ph)))

Pg<-matrix(0,ncol=m)

Ph<-matrix(0,ncol=m)

Pg[(m-length(pg)+1):m]<-pg

Ph[(m-length(ph)+1):m]<-ph

third<-third+sqrt((entropia((Pg+Ph)/2)-(entropia(pg)+entropia(ph))/2)/log(2))


}

return(w1*first+w2*second+w3*third)


}



# rm(list=setdiff(ls(),lsf.str()))


# g3 <- graph.graphdb("si6_r005_s100.B99") database de graph isomorphism 
#write(
