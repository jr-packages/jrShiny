force:

deploy:
	Rscript -e 'deployApp("vignettes/shiny_components_reactive.Rmd", account="csgillespie")'

install:
	R CMD INSTALL ../nclRshiny_*.tar.gz

clean:
	cd vignettes && rm -fv *.R *.html tmp* Rplots*.pdf && rm -fvr rsconnect
	rm -fv inst/exercises/*.html #inst/exercises/*.R
	rm -fv tmp* exercise?.Rmd R/tmp?.*
	cd ../ && rm -fvr nclR*.tar.gz
	rm -fvr exercises original
	cd vignettes && rm -fvr *_cache *_files
	
cleaner:
	cd inst && rm -fvr chapter?/*.html *.html