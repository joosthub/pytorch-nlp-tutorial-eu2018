FROM jupyter/minimal-notebook:ae885c0a6226

# launchbot-specific labels
LABEL name.launchbot.io="nlp_with_dl"
LABEL workdir.launchbot.io="/home/jovyan"
LABEL description.launchbot.io="Natural Language Processing with Deep Learning"
LABEL 8888.port.launchbot.io="Jupyter Notebook"

#USER root

# Install requirements
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Install pytorch
RUN pip install http://download.pytorch.org/whl/cpu/torch-0.4.1-cp36-cp36m-linux_x86_64.whl \
			&& pip install torchvision

RUN jupyter nbextension enable --py widgetsnbextension

# Set the working directory
WORKDIR /home/jovyan

# Add files
COPY data/trump.csv /home/jovyan/data/trump.csv
COPY data/surnames.csv /home/jovyan/data/surnames.csv
COPY data/glove.6B.100d.txt /home/jovyan/data/glove.6B.100d.txt
COPY data/firstnames.csv /home/jovyan/data/firstnames.csv
COPY data/amazon_train_small.csv /home/jovyan/data/amazon_train_small.csv
COPY data/surnames.csv /home/jovyan/data/surnames.csv
COPY data/zhnews.csv /home/jovyan/data/zhnews.csv

COPY modelzoo/ /home/jovyan/modelzoo

COPY day_1 /home/jovyan/day_1
COPY day_2 /home/jovyan/day_2

USER root
RUN chown -R $NB_USER /home/jovyan/day_* \
		&& chmod -R 774 /home/jovyan/day_*
USER $NB_USER

# Expose the notebook port
EXPOSE 8888

# Start the notebook server
CMD jupyter notebook --no-browser --port 8888 --ip=* --NotebookApp.token='' --NotebookApp.disable_check_xsrf=True
