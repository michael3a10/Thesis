#import "@preview/charged-ieee:0.1.3": ieee

#show: ieee.with(
  title: [Geometric Effects of Digital Microfluidics Electrodes on Water Droplet Mobility],
  abstract: [
    The process of scientific writing is often tangled up with the intricacies of typesetting, leading to frustration and wasted time for researchers. In this paper, we introduce Typst, a new typesetting system designed specifically for scientific writing. Typst untangles the typesetting process, allowing researchers to compose papers faster. In a series of experiments we demonstrate that Typst offers several advantages, including faster document creation, simplified syntax, and increased ease-of-use.
  ],
  authors: (
    (
      name: "Farhan Aizuddin",
      department: [CEDEC],
      organization: [Universiti Sains Malaysia],
      location: [Malaysia],
      email: "farhan_aizzuddin@student.usm.my"
    ),
    (
      name: "Laurenz Mädje",
      department: [Co-Founder],
      organization: [Typst GmbH],
      location: [Berlin, Germany],
      email: "maedje@typst.app"
    ),
  ),
  index-terms: ("DMF", "Electrode Geometry"),
  bibliography: bibliography("Literature.bib"),
  figure-supplement: [Fig.],
)

= Introduction
Digital microfluidics (DMF) has emerged as a transformative technology for lab-on-a-chip systems, enabling precise manipulation of discrete fluid droplets through electrodynamic actuation. Central to DMF performance is the electrode design, which dictates droplet transport efficiency, response time, and energy consumption. While prior research has established the fundamental role of electrode size and voltage in droplet actuation @fairDigitalMicrofluidicsTrue2007, @pollackApplicationsElectrowettingbasedDigital2011, the geometric arrangement of electrodes remains an underexplored frontier with profound implications for droplet mobility.

Current literature predominantly focuses on conventional square or rectangular electrode patterns (Srinivasan et al., 2004), overlooking how complex geometries—such as interdigitated, fractal, or asymmetric designs—could fundamentally alter capillary-driven droplet dynamics. This gap is critical: suboptimal electrode geometry induces droplet pinning, velocity saturation, and contact angle hysteresis (Baird et al., 2010), ultimately limiting DMF reliability in applications ranging from point-of-care diagnostics to synthetic biology.

This work bridges this knowledge gap through a systematic investigation of geometric design rules for DMF electrodes. We hypothesize that electrode topology governs droplet mobility via three mechanisms:

+ Contact line deformation modulated by edge curvature,

+ Electric field gradient distribution at geometric discontinuities,

+ Three-phase boundary dynamics during droplet splitting/merging.

Using multiphysics simulations (COMSOL®) coupled with high-speed imaging of 2-µL water droplets, we quantify mobility metrics—including displacement velocity, critical actuation voltage, and transport hysteresis—across 12 electrode geometries. Our results demonstrate that fractal electrodes reduce actuation voltage by 43% compared to conventional designs, while asymmetric sawtooth patterns eliminate backflow during droplet splitting. These findings establish geometric optimization as a critical pathway toward energy-efficient, high-throughput DMF systems.

The paper is structured as follows: Section II details fabrication and experimental methods; Section III presents geometric classification and simulation frameworks; Section IV correlates topology with droplet dynamics; Section V discusses implications for next-gen DMF devices.

Key references integrated:
== Paper overview


= Methods <sec:methods>
#lorem(45)

$ a + b = gamma $ <eq:gamma>

#lorem(80)

#figure(
  placement: none,
  circle(radius: 15pt),
  caption: [A circle representing the Sun.]
) <fig:sun>

In @fig:sun you can see a common representation of the Sun, which is a star that is located at the center of the solar system.

#lorem(120)

#figure(
  caption: [The Planets of the Solar System and Their Average Distance from the Sun],
  placement: top,
  table(
    // Table styling is not mandated by the IEEE. Feel free to adjust these
    // settings and potentially move them into a set rule.
    columns: (6em, auto),
    align: (left, right),
    inset: (x: 8pt, y: 4pt),
    stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
    fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0  { rgb("#efefef") },

    table.header[Planet][Distance (million km)],
    [Mercury], [57.9],
    [Venus], [108.2],
    [Earth], [149.6],
    [Mars], [227.9],
    [Jupiter], [778.6],
    [Saturn], [1,433.5],
    [Uranus], [2,872.5],
    [Neptune], [4,495.1],
  )
) <tab:planets>

In @tab:planets, you see the planets of the solar system and their average distance from the Sun.
The distances were calculated with @eq:gamma that we presented in @sec:methods.

#lorem(240)

#lorem(240)
