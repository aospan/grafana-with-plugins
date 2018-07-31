FROM raymondmm/grafana 

LABEL maintainer="aospan@jokersys.com"

# install grafana plugins in build time (not runtime)
# useful when target host doesn't have access to internet in run time

USER root
RUN mkdir -p /data/grafana/plugins && chown -R grafana:grafana /data/grafana/plugins
RUN grafana-cli --pluginsDir "/data/grafana/plugins" plugins install grafana-clock-panel \
	&& grafana-cli --pluginsDir "/data/grafana/plugins" plugins install grafana-simple-json-datasource \
	&& grafana-cli --pluginsDir "/data/grafana/plugins" plugins install briangann-gauge-panel \
	&& grafana-cli --pluginsDir "/data/grafana/plugins" plugins install natel-plotly-panel
