# model-leaf Manual page


## Name

model-leaf - the leaf model simple interface


## Synopsis

model-leaf [--version]  [--help] <command> [<args>]


## Description

Model-leaf uses the Tensorflow implementation of Mask-RCNN by MatterPort and a handful of integration scripts and utilities to simplify training and inference of leaf datasets.

For information on the different subcommands read the according manual pages


## Options


###### -h


###### --help

Prints the synopsis and the list of possible options and commands.


###### -v


###### --version

Prints the leaf-model command line version


## Subcommands


###### [model-leaf-train](#bookmark=kix.d73ecqfzwil1)

Train a model from a dataset


###### [model-leaf-infer](#bookmark=id.omgzqarzcj72)

Run inference on a directory of pictures, using a pretrained model


###### [model-leaf-cut](#bookmark=id.t0gg9bnl4kan)

Cut leaves from annotated data


###### [model-leaf-info](#bookmark=kix.icual4pnf7xg)

Print model metadata

 


# model-leaf-train Manual Page


## Name

model-leaf-train - train a model for leaves


## Synopsis

model-leaf train [-o <path> | --output=<path>] [-k <value> | --dataset-keep=<value>]  

[-t <path> | --test-set=<path>] [-c <configfile> | --config=<configfile>] 

[--preview-only] <datasetpath> <bg-path>


## Notes

<datasetpath> Should be the path to a json annotation file with valid relative paths to the images.

<bg-path> Path to a directory containing the synthetic backgrounds.


## Description

Creates a dataset of synthetic pictures, and runs the training model on the dataset. The best result model is saved as a .h5 file. 


## Options


###### -o <path>


###### --output=<path>			

specify path to .h5 model location [default: current]


###### -k <value>


######  --dataset-keep=<value>	

specify how many samples to keep (default 0)


###### -t <path>


###### --test-set=<path>	

specify path to test set 


###### -c <path>


###### --config=<path>			

specify path to the model (mask-r cnn) config file.


###### -s (random | grouped)


###### --synthetic=(random | grouped)

Set the synthetic dataset generator to scatter the leaves randomly (cucumber), or to group the leaves around a base (banana)


###### --leaf-size-min=<size>

Set the minimum size of leaves in the synthetic picture


###### --leaf-size-max=<size>

Set the maximum size of leaves in the synthetic picture


###### --leaf-number-min=<number>

Set the minimum number of leaves in the synthetic picture


###### --leaf-number-max=<number>

Set the maximum number of leaves in the synthetic picture


###### --preview-only=<number>			

generate samples of training set without training the model

 


# model-leaf-infer Manual page


## Name

model-leaf-infer - leaf inference command


## Synopsis

model-leaf infer [-o <path> | --output=<path>] [--pictures-only | --contour-only] 


    <modelpath> <picturespath>


## Description

Loads a dataset, loads a model, runs inference on all the pictures located in a directory. Outputs a set of pictures with a translucent mask on every detected leaf. Additionally, a json annotation file is generated.


## Options


###### -o <path>


###### --output=<path>

Set output directory [default: current] 


###### --pictures-only

Create only infered pictures with colorful transparent masks \



###### --contour-only 		

Create contour annotation file only



# model-leaf-cut Manual page


## Name

model-leaf-cut - single leaf extractor


## Synopsis

 model-leaf cut [-n <width>| --normalize=<width>] 

[-b | --background=(black | white | original)] [--no-alpha] <jsonpath>


## Description

Cut single leaf pictures from an annotated dataset


## Options


###### -n <width-size>


###### --normalize=<width-size>

Normalize the generated pictures to the specified width-size. By default pictures are not normalized, every leaf stays at its original size


###### -b ( black | white | original )


###### --background=( black | white | original )

Specify the RGB background of the leaf, regardless of the alpha channel value [default: original]


###### --no-alpha

Do not apply alpha around objects




# model-leaf-info Manual page


## Name

model-leaf-info - model metadata extractor


## Synopsis

 model-leaf info <modelpath>


## Description

Prints information about the model saved in the model-info variable


## Options

None

Development notes...


