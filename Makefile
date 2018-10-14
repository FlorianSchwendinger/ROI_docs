
all: render_all clean copy_precompiled

index: render_index clean

inst: render_inst clean

copy_precompiled:
	cp precompiled/*.html _site/

render_all:
	R -e "rmarkdown::render_site()"

render_index:
	R -e "rmarkdown::render_site('index.Rmd')"

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

clean:
	rm -f gurobi.log  _site/gurobi.log _site/Makefile
	rm -rf _site/precompiled

clean_all: clean
	rm -rf _site

sync_www:
	rsync --progress -avuz _site/* /home/florian/work/Optimization/ROI/ROI_R-Forge/www/

sync_git:
	rsync --progress -avuz --exclude '_site' * /home/florian/work/Optimization/ROI/ROI_docs/

