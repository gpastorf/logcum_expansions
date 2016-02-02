# logcum_expansions

# Edgeworth and Cornish-Fisher expansions using log-cumulants

This code package is related to the follow scientific articles:

- G. Pastor, I. Mora-Jiménez, A.J. Caamaño, and R. Jäntti, “Asymptotic Expansions for Heavy-tailed Data”, IEEE Signal Process. Lett., 2016 (Accepted)
- G. Pastor, I. Mora-Jiménez, A.J. Caamaño, and R. Jäntti, “Log-Cumulants-based Edgeworth Expansion for Skew-Distributed Aggregate Interference”, IEEE Proc. of the 11th ISWCS, Barcelona, Spain, Aug 2014 

The package contains Matlab codes that compute the Edgeworth and Cornish-Fisher expansions used in the above articles. 

# Abstract of Article
Heavy-tailed distributions are present in characterization of different modern systems. They capture the acquisition complexity in high-resolution imaging and are extracted from traffic traces in cloud computing infrastructures and cognitive radio networks. Commonly the cumulants of these distributions cannot be defined starting from a certain order. This restricts the applicability of traditional approximation methods. To fill this gap, this paper extends the usability of the Edgeworth and Cornish-Fisher expansions, which are based on cumulants, to analogous asymptotic expansions based on log-cumulants. The proposed expansions inherit the capability of log-cumulants to characterize heavy-tailed distributions and parallel traditional expansions, thus they are readily implemented. Numerical simulations show the accuracy of proposed expansions to approximate also light-tailed data.

# Content of Code Package
The article contains 12 Matlab scripts. The main function files are tksedgeworth.m and tkscornish.m both of which can be evaluated using tests.m file. 
See each file for further documentation. 

# Acknowledgements
This work has been supported by the Finnish Cultural Foundation and the (Spanish) Ministry of Economy and Competitiveness.

# License and Referencing
This code package is licensed under the GPLv2 license. If you in any way use this code for research that results in publications, please cite our original article listed above.
