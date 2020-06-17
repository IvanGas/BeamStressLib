# BeamStressLib
Simscape is a powerful tool embedded in MATLAB-Simulink environment that helps you to model physical systems. Simscape multubody give the possibility to model flexible beams using Euler theory. However, in engineering problems, it is very common to design and optimize structural elements, and for this reason it is important to keep under control the stress in the structure. Simscape library does not provide such important information (and moreover it is not easy to extract information like displacements or forces).
The aim of this library is to expand Simscape beam library, providing all the information an engineer requires, in a straightforward way.


This block relies on Simscape "General Flexible Beam" to represent static and dynamic behaviour of flexible beam, with a rectangular cross-section, estimating the stress (and other results) at its ends. The flexible element used is "General Flexible Beam" of Simscape library in order to be compatible also with Simscape releases before 2020a.

A routine helps you to visualize the stress data and better understanding the stress distribution in the cross section. You can turn on and off the visualization routine in the "Output Parameters" tab.
IMPORTANT: stresses are computed only on 9 points in the cross section. The plot adopts a linear interpolation between those points just to better visualize, with some approximation, the stress distribution.

This custom block allows you to input geometry, material of the beam, and when you connect the two ports of the beam to the rest of the world, it computes stress, strain displacement and applied loads on the beam ends. Data refer to the International System of Units (m, rad, s) even if the Young modulus E and the stress are measured in MPa (and not Pa), as in the usual practice.

Stresses are evaluated keeping into account both bending stress, normal stress, shear stress and torsional stress in 9 different points of the cross-section of the beam (at the four edges, four in the middle of each side and one in the center of the beam). Stresses are combined according to Von-Mises equivalent stress. The stress analysis, as well as the Simscape beam model (General Flexible Beam), assume the beam is “long”, in comparison to the cross-section, adopting Euler-theory where the bending effect is greater than shear effect (i.e. shear compliance is neglected). In other words, the length of the beam should be about x10 times the cross-section side. Only for short beams shear deflection is not negligible and therefore it is better to use Timoshenko-Ehrenfest beam theory (at the moment not implemented in Simscape).

The results of this library were checked with a professional FEM software, showing a good agreement.
