
#complete phenotype simulations by looping through parameter values and calling 
#pheno_sim_1iter.R for each set of parameters.

N <- 10000
herit <- 1
out_dir <- "out_061318/"

#nsamps <- 20
sel.intenses <- .005
n.locis <- c(100)
n_chromss <- c(200)
ts <- c(0.0)
t.offs <- c(0.0)
phen_nums <- 101:1000 #1 number for each rep we want to do at each combination of parameters

traj.fn <- "temp_out1/temp.txt"
msout.fn <- "temp_out1/ms_out.txt"
rent_in_fn <- "temp_out1/rent_in.txt"
rent_in_fn.ro <- rent_in_fn

helper_fn <- "../../helper_functions_coal_sel.R"
source(helper_fn) #read in helper functions and load ape package

ms_dir <- "../../msseldir/"
rentplus_fn <- "../../RentPlus.jar"
len_hap <- 200000 #the length (in base pairs) of the haplotype -- short because 
#we are not worrying about recombination--just need the sel site.
sel_site <- 100000 #the position of the selected site in the haplotype
u <- 2e-8 #the neutral mutation rate per base pair/generation
r <- 2.5e-8 #the recombination rate per base pair/generation
options(scipen = 999) #disable scientific notation so that parameters passed to ms are given as numbers
sd.trait <- 1

time <- c(seq(0, 4, by = 0.001))
pars.mat070616 <- expand.grid(sel.intenses, n.locis, n_chromss, ts, t.offs, phen_nums)


for(repet in 1:dim(pars.mat070616)[1]){
	sel.intens <- pars.mat070616[repet,1]
	n.loci <- pars.mat070616[repet,2]
	n_chroms <- pars.mat070616[repet,3]
	t <- pars.mat070616[repet,4]
	t.off <- pars.mat070616[repet,5]
	phen_num <- pars.mat070616[repet,6]
	#source("../pheno_sim_1iter_rentonly.R")
	source("../pheno_sim_1iter_norent_notraj.R")
	print(paste("trial", as.character(repet), "complete."))
}


#save.image(paste("sim_trees", ".RData", sep = ""))





