package ["python-igraph", "readpst", "python-numpy", "python-scipy", "python-matplotlib", "python-pandas", "python-sympy", "python-nose"] do
  action :latest
end

python_package "python-dateutil"
python_package "numpy"
python_package "jinja2"
python_package "https://github.com/mattgwwalker/msg-extractor/zipball/master"
python_package "olefile"
python_package "scikit-image"
python_package "scikit-learn"
python_package "Pillow"
python_package "textblob"
python_package "phonenumbers"
python_package "exifread"
python_package "dill"
python_package "reverend"

execute "python -m textblob.download_corpora"


git "newman" do
  repository node['sotera-newman']['newman']['git_repository']
  revision  node['sotera-newman']['newman']['git_revision']
  destination node['sotera-newman']['newman']['git_destination']
  action :sync
end


git "newman-research" do
  repository node['sotera-newman']['newman_research']['git_repository']
  revision  node['sotera-newman']['newman_research']['git_revision']
  destination node['sotera-newman']['newman_research']['git_destination']
  action :sync
end


git "pst-extraction" do
  repository node['sotera-newman']['pst_extraction']['git_repository']
  revision  node['sotera-newman']['pst_extraction']['git_revision']
  destination node['sotera-newman']['pst_extraction']['git_destination']
  action :sync
end


# Create MITIE links to pst-extraction-master.
# This needs safe-guards put in place
link "/srv/software/MITIE/MITIE-models/english/ner_model.dat" do
  to "/srv/software/pst-extraction-master/ner_model_english.dat"
end


link "/srv/software/MITIE/MITIE-models/spanish/ner_model.dat" do
  to "/srv/software/pst-extraction-master/ner_model_spanish.dat"
end


link "/srv/software/MITIE/mitielib/libmitie.a" do
  to "/srv/software/pst-extraction-master/libmitie.a"
end


link "/srv/software/MITIE/mitielib/libmitie.so" do
  to "/srv/software/pst-extraction-master/libmitie.so"
end


link "/srv/software/MITIE/mitielib/mitie.py" do
  to "/srv/software/pst-extraction-master/mitie.py"
end


execute "./bin/build_clavin_index.sh" do
  cwd "/srv/software/pst-extraction-master"
end

execute "./bin/setup_geo2ip" do
  cwd "/srv/software/pst-extraction-master"
end

execute "mvn clean package" do
  cwd "/srv/software/pst-extraction-master/spark-java"
end

execute "target/newman-spark-tika-0.1-SNAPSHOT-jar-with-dependencies.jar ../lib/" do
  cwd "/srv/software/pst-extraction-master/spark-java"
end