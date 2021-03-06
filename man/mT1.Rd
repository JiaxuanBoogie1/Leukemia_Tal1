% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mT1.r, R/main.r
\docType{package}
\name{mT1}
\alias{mT1}
\alias{mT1-package}
\alias{mT1}
\title{Motifs in Tandem with One Another}
\usage{
mT1(fasta, motifs, verbose = FALSE, cl = NULL)
}
\arguments{
\item{fasta}{The set of genomic locations as a DNAStringSet}

\item{motifs}{The list of three or more motifs being compared,
IUPAC chars only.}

\item{verbose}{A flag to print motifs as completed.}

\item{cl}{A cluster from makeForkCluster}
}
\value{
A mT1 object
}
\description{
Motifs in Tandem with One Another

Generates a mT1 object from DNAStringSet and a vector of motifs. A mT1
object can be used for the investigation of preferred motif positions
and identifying composite motifs. There must be at least 3 motifs being
compared. For the comparison of two motifs look at motifDiff. The purpose
of a mT1 object is to identify novel preferred distances from a large
set of motifs.
}
\examples{
library(Biostrings) # needed to get fasta data from genomic co-ords
library(BSgenome.Hsapiens.UCSC.hg19) # genome
## load a set of Jaspar motifs as strings
## load(system.file("extdata","jaspar.RData",package="mT1"))
jaspar<-mT1_jaspar
## Example set of peaks
## load(system.file("extdata","peaks.RData",package="mT1"))
peaks<-mT1_peaks
## Transform genomic co-ords into neucleotides
genome<-BSgenome.Hsapiens.UCSC.hg19
fasta<-getSeq(genome,peaks$chr,start=peaks$start,end=peaks$end)

## Motifs to compare
motifs<-c("CANNTG","GATAA",jaspar$jsublM[1:2])

## Find the preferred distances between `motifs` under the peaks
my_sampleMT1<-mT1(fasta,motifs)

## plot based on string
plot(my_sampleMT1,"CANNTG","GATAA")

## Plot based on printed order
print(my_sampleMT1)
plot(my_sampleMT1,i=1)
}
\author{
"Alexander Griffith <griffitaj@gmail.com>"
}
