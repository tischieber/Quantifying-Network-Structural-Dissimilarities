# QDN_Nature_Comms
 Quantifying structural dissimilarities in networks  

Graph's Dissimilarity Measure  (D)


In this repository, you will find the codes and instances used in the article:

Quantifying network structural dissimilarities by Tiago A. Schieber, Laura Carpi, Albert Díaz-Guilera, Panos M. Pardalos, Cristina Masoller and Martín G. Ravetti

%%%%%%%%%%%%%%%%

Algorithm
The algorithm is written in R and uses functions from the igraph library (The Network Analysis Package). The program reads two graphs on an edge list format, and computes the D-distance, as discussed in the article. 

download algorithm: d_distance.r

Instructions: after running the d_distance.r file make:

D(g,h,w1,w2,w3)

For example, D("net1.txt","net2.txt",0.45,0.45,0.1) computes the D measure considering w1=0.45, w2=0.45 and w3=0.1 between the networks net1.txt and net2.txt in an edgelist format.

%%%%%%%%%%%%%%%%

Instances for the non-isomorphic test
The experiment consists in computing the D-distance between pairs of known non-isomorphic graphs.  

Generation
Nauty and Traces are programs for computing automorphism groups of graphs and digraphs. They can also produce a canonical labeling. See Brendan McKay and Adolfo Piperno's web page for more information.
Here, we use geng to generate all graphs of a specified class and showg to write graphs in human-readable format.

Our distance returns a positive value for all the cases here considered.

 Nodes	 #graphs 	Filename
4	11 	        graph_n=4 ;
5	34	        graph_n=5 ;
6	156	        graph_n=6  ;     
7	1044	        graph_n=7 ;
8	12346 	        graph_n=8 ;
9 	274668	        graph_n=9 ;
10 12005168 	graph_n=10 ;


20 Nodes

When considering 20 nodes, the complete set of non-isomorphic graphs has approximately 6.4 x 10^38 graphs. In this case, we focus on trees and connected k-regular graphs. 

k-regular graphs


k	 # graphs
	  dataset           (7z zip files)
2 
	1 	        regular_graph_n=20_k=2   (34 bytes)
3	5104            regular_graph_n=20_k=3   (17 MB)
4	1533866586 	regular_graph_n=20_k=4   (7 GB)
5	476565504 	regular_graph_n=20_k=5   (2 GB)
6	188290831 	regular_graph_n=20_k=6   (731 MB)
7	93595527 	regular_graph_n=20_k=7   (374 MB)
8	25954544 	regular_graph_n=20_k=8   (99 MB)
9	15752252 	regular_graph_n=20_k=9   (76 MB)
10	8998309 	regular_graph_n=20_k=10  (49 MB)
11	10245059 	regular_graph_n=20_k=11  (52 MB)
12 	14024101	regular_graph_n=20_k=12  (69 MB) 


Non-isomorphic connected trees


Nodes	 # graphs
	  dataset
18 	123867 	    connected_trees_n=18 (3 MB) 
20 	823065	    connected_trees_n=20 (27 MB) 
21	2144505	    connected_trees_n=21 (76 MB)
 


Contact information

Martin Gómez Ravetti  - martin.ravetti at dep.ufmg.br.
