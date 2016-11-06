---
title: Getting Started
date: 2016-11-06 11:13:13
---

NYUAD analyses are created to be 100% composable and reproducible. The software stacks and template analyses are publically available.

You can view all the gencore software stacks at [anaconda cloud](https://anaconda.org/nyuad-cgsb/environments).

## Getting the software

### Recommended - Install the gencore module

If you are installing a gencore module for the first time, you will need to run the full bootstrap method. This will install the gencore_variant_detection_1.0 stack.

If you do not wish to install the software as a gencore module, please see below for package installation methods.

{% codeblock %}
wget https://raw.githubusercontent.com/nyuad-cgsb/nyuad-hpc-module-configs/master/scripts/user_install.sh
chmod 777 user_install.sh
./user_install.sh
{% endcodeblock %}

If you have already gone through this process, you can install any gencore module with.

{% codeblock %}
conda env create --quiet nyuad-cgsb/gencore_variant_detection_1.0
source activate gencore_variant_detection_1.0
{% endcodeblock %}

### Note for NYUAD Users

You do not need to install anything. Simply load the gencore modules.

{% codeblock %}
module load gencore/1 gencore_variant_detection/1.0
{% endcodeblock %}

## BioX-Workflow

BioX::Workflow is available as a [cpan module](https://metacpan.org/pod/BioX::Workflow), and as a conda package through the [bioconda channel](https://bioconda.github.io/recipes/perl-biox-workflow/README.html).

### Install with cpanm

{% codeblock %}
cpanm install BioX::Workflow
{% endcodeblock %}

### Install with bioconda

[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg?style=flat-square)](http://bioconda.github.io/recipes/perl-biox-workflow/README.html)

{% codeblock %}
conda install -c bioconda perl-biox-workflow
{% endcodeblock %}

## HPC::Runner::Command 

HPC::Runner::Command is available as a [cpan module](https://metacpan.org/pod/HPC::Runner::Command), and is coming soon as a bioconda conda package.

### Install with cpanm

{% codeblock %}
cpanm install HPC::Runner::Command
{% endcodeblock %}

### Install with bioconda

Coming Soon!
