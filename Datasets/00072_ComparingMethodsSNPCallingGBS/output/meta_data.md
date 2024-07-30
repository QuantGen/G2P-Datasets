# Testing pipelines for genome-wide SNP calling from Genotyping-By-Sequencing (GBS) data for Pinus ponderosa

This publication discusses: Background

Single Nucleotide Polymorphism (SNP) markers have rapidly gained popularity due to their abundance in most genomes and their amenability to high-throughput genotyping techniques. Reduced-representation restriction-enzyme-based sequencing methods (GBS or RADseq) have been demonstrated to be robust and cost-effective genotyping methods. While previous studies have shown that alignment of the short-read fragments to a genome sequence results in better SNP calling than de novo approaches, only a few tree species - and few conifers in particular - have an annotated sequence. While these could be used to align sequence fragments from related species, sequence divergence might result in SNPs being missed if they are in fragments that don't align properly. Producing a new annotated genome sequence for every conifer species before SNP analyses are conducted is still prohibitive, as many conifer genomes are huge (>‚Äâ19 GB) and include a large proportion of repeat sequences, making assembly difficult. Here we compare four bioinformatics pipelines, two of which require a reference genome (TASSEL-GBS V2 and Stacks), two of which are de novo pipelines (UNEAK and Stacks). We used Illumina sequence data from 94 ponderosa pines, with loblolly pine as the reference genome.



Results

The number of SNPs called was much lower without a reference genome (62‚Äì196 thousand vs. 2.1‚Äì2.7 million SNPs). UNEAK was the fastest overall and identified more SNPs than Stacks de novo. Stacks with a reference genome produced the highest number of SNPs with lowest proportion of paralogs, while SNPs identified by TASSEL-GBS V2 exhibited the highest heterozygosity, minor allele frequency, and proportion of paralogs. More SNPs were uniquely identified by Stacks than TASSEL, though there was high overlap between methods.



Conclusion

The present case study provides a comprehensive comparison between four commonly-used SNP calling pipelines, and identifies the Stacks reference-based approach as the best overall for conifers (or other species with large repetitive genomes) that do not have a published reference genome for the same species. However, all four pipelines had distinct benefits and limitations, with Stacks for instance being less user-friendly than some of the other pipelines. In addition, researchers studying other conifer species using similar approaches should be prepared to analyze very large numbers of SNPs.

It contains 96 genotypes and 2131362 markers.

Title: Testing pipelines for genome-wide SNP calling from Genotyping-By-Sequencing (GBS) data for Pinus ponderosa

Scientific name: Pinus ponderosa

Common name: Ponderosa pine

DOI: https://doi.org/10.5061/dryad.6fv8fb4


