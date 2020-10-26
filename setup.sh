ENV_NAME=leafsegmentor
CONDA_INSTALL_NAME=miniconda_install.sh

# Install conda if not installed
if [[ ! $(command -v conda) ]]; then

  if [[ ! -f ~/$CONDA_INSTALL_NAME ]]; then
    curl -o ~/$CONDA_INSTALL_NAME https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  fi

  # Add conda to bash profile
  cd ~
  bash $CONDA_INSTALL_NAME
  echo ". ~/.bashrc" >> ~/.bash_profile
  . ~/.bash_profile
fi

# Create leafsegmentor conda environment
if [[ "$(conda env list | grep $ENV_NAME | awk '{print $1}')" != $ENV_NAME ]] ; then
  conda env create --name $ENV_NAME -v -f environment.yml;
  echo "alias leafsegmentor='conda deactivate && conda activate $ENV_NAME && python LeafSegmentor.py'" >> ~/.bash_profile
  . ~/.bash_profile
fi

# Copy example files to user directory
if [[ ! -d ../models ]]; then
  echo "copying model files..."
  #rsync --info=progress2 -r /mnt/gluster/shares/WP2_Analysis/WP2_models/Kimmel/LeafSegmentor_data/models ..
fi

if [[ ! -d ../cut_jobs ]]; then
  echo "copying example cut jobs..."
  #rsync --info=progress2 -r /mnt/gluster/shares/WP2_Analysis/WP2_models/Kimmel/LeafSegmentor_data/cut_jobs ..
fi

if [[ ! -d ../datasets ]]; then
  echo "copying example files for train and inference"
  mkdir ../datasets
  #rsync --info=progress2 -r /mnt/gluster/shares/WP2_Analysis/WP2_models/Kimmel/LeafSegmentor_data/dataset/examples ../datasets/.
fi
