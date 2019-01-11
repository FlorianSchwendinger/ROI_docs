
all: render_all clean copy_precompiled

index: render_index clean

inst: render_inst clean

copy_precompiled:
	cp precompiled/*.html _site/

render_all:
	R -e "rmarkdown::render_site()"

render_index:
	R -e "rmarkdown::render_site('index.Rmd')"

render_intro:
	R -e "rmarkdown::render_site('introduction.Rmd')"

render_intro_conic:
	R -e "rmarkdown::render_site('introduction_conic_optimization.Rmd')"

render_inst:
	R -e "rmarkdown::render_site('installation.Rmd')"

render_mixed:
	R -e "rmarkdown::render_site('mixed.Rmd')"

render_faq:
	R -e "rmarkdown::render_site('faq.Rmd')"

render_faq_autodiff:
	R -e "rmarkdown::render_site('faq_autodiff.Rmd')"

render_news:
	R -e "rmarkdown::render_site('news.Rmd')"

render_use_cases:
	R -e "rmarkdown::render_site('use_cases.Rmd')"

render_use_case_ols:
	R -e "rmarkdown::render_site('use_case_linear_regression.Rmd')"

render_use_case_logreg:
	R -e "rmarkdown::render_site('use_case_logistic_regression.Rmd')"

render_use_case_portfolio_optimization:
	R -e "rmarkdown::render_site('use_case_portfolio_optimization.Rmd')"

stangle_use_case_portfolio_optimization:
	R -e "knitr::purl('use_case_portfolio_optimization.Rmd')"

render_use_case_:
	R -e "rmarkdown::render_site('use_case__regression.Rmd')"

clean:
	rm -f gurobi.log  _site/gurobi.log _site/Makefile _site/ROI.bib
	rm -rf _site/precompiled
	rm -rf _site/devel
	rm -rf _site/cache

clean_all: clean
	rm -rf _site

sync_www:
	rsync --progress -avuz _site/* /home/florian/work/Optimization/ROI/ROI_R-Forge/www/

sync_git:
	rsync --progress -avuz --exclude '_site' * /home/florian/work/Optimization/ROI/ROI_docs/

