# EIRME
open source codes of paper:《Ensemble-Based Information Retrieval With Mass Estimation for Hyperspectral Target Detection》

DOI: 10.1109/TGRS.2021.3075583
# Abstract
Given the prior information of target, hyperspectral target detection focuses on exploiting spectral differences to separate objects of interest from the background, which can be treated as an information retrieval (IR) task in machine learning (ML). Most traditional detection methods work in the original feature space and rely heavily on specific assumptions, which cannot guarantee effective extraction of features for the target and background in hyperspectral images (HSIs). Mass estimation (ME) is a base modelling mechanism that has been proven to effectively solve problems in IR and is not restricted by specific assumptions. In this paper, we propose a novel target detection method through ensemble-based information retrieval with mass estimation (EIRME). By directly deriving the ordering from a sample set to rank data points, ME provides a simple and straightforward ranking measure to ensure that points similar to the given target are far away from dissimilar points. For the estimation of mass distribution, the proposed method utilizes a tree-structured mapping to generate a feature space, in which the separability of the target and background is further improved. In particular, to break through the technical difficulty that the direct migration of information retrieval methods with mass measure cannot specifically meet the high-precision requirements of target detection in HSIs, we develop a specialized measurement, topological mass, which innovatively combines the mass measure with tree topology to quantify the spectral difference for detection output. Moreover, the IR with ME based on parallel measurements through ensemble trees provides a robust solution with better generalization capacity and higher precision for hyperspectral target detection, facilitating practical applications. Experimental results on benchmark HSI data sets prove that the specialized measurement we developed successfully overcomes the drawbacks of the direct migration of IR methods with ME and exhibits unique advantages. In addition, comparisons with the most classic and advanced detection algorithms demonstrate the superiority of the proposed method.
# Index Terms
Hyperspectral image, target detection, information retrieval, mass estimation, machine learning.
# Flowchart
![flowchart](https://github.com/sxt1996/EIRME/assets/55687887/8b82b113-f8f1-46b2-b2cf-262518403bb2)
# Data Set
AVIRIS-1: This data set was captured by the Airborne Visible/Infrared Imaging Spectrometer (AVIRIS). The full image covering an urban scene in San Diego contains 400×400 pixels, and the spatial resolution is 3.5 m per pixel. This is a sub-image containing 100×100 pixels selected from the entire scene. The original image contains 224 bands spanning the wavelength range of 370 to 2510 nm. After removing the water absorption and low SNR bands, 189 bands are reserved for the experiments. Three airplanes occupying 22, 22, and 20 pixels are regarded as targets of interest.
# Guidelines
1. Install R2014a or higher versions of MATLAB.
2. Download this code package.
3. Set path.
4. Don't worry about importing data or anything else, just run Main.m.
# Contact
If you have any questions, please feel free to contact me.
sxt1996@outlook.com
