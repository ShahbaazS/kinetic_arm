// By Emese Elkind, Shahbaaz Siddiqui, and Raquel Casas from Queen's University
// Above-elbow, 3D printable prosthetic arm

// Preview Each Part
part = "ForearmA"; // [ ForearmA:ForearmA, ForearmB:ForearmB, ForearmC:ForearmC, ForearmD:ForearmD,ForearmE:ForearmE, ForearmF:ForearmF, UpperArm:UpperArm, UpperArmCover:UpperArmCover, TypeAClosedForearm:TypeAClosedForearm, TypeAForearmStraps:TypeAForearmStraps, Palm:Palm, UpperArmCuff:UpperArmCuff]

// Choose Left or Right Hand
LeftRight = "Left"; // [Left,Right]
// Wrist to elbow crease (mm)
ArmLength = 282; //[141: 564]
// Circumference of Forearm just below elbow crease (mm)
ForearmCircumference = 271; //[135: 542]
// Circumference of Bicep (mm)
BicepCircumference = 294; //[147: 588]
// Padding Thickness -inside forearm and cuff (mm)
PaddingThickness = 2; //[0: 10]

/* [Hidden] */

PI = 3.141592653589793238;

// These are the "100%" reference values the original arm was designed for.
// If the Kinetic arm uses different base sizes, replace 282 / 271 / 294 with those.
BaseArmLength             = 282;  // mm
BaseForearmCircumference  = 271;  // mm
BaseBicepCircumference    = 294;  // mm

// Scale along the arm (wrist → elbow)
ArmScale = ArmLength / BaseArmLength;

// Scale around the forearm (X/Y) including padding
ForearmCircumferenceWPadding = ((ForearmCircumference/PI) + 2*PaddingThickness) * PI;
ArmCircumferenceScale        = ForearmCircumferenceWPadding / BaseForearmCircumference;

// Scale around the upper arm (for the upper arm pieces)
BicepCircumferenceWPadding = ((BicepCircumference/PI) + 2*PaddingThickness) * PI;
CuffScale                  = BicepCircumferenceWPadding / BaseBicepCircumference;

print_part();

module print_part( ) {
    // --- Kinetic Forearm types ---
    if (part == "ForearmA") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) ForearmA();
        } else {
            ForearmA();
        }
    }

    if (part == "ForearmB") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) ForearmB();
        } else {
            ForearmB();
        }
    }

    if (part == "ForearmC") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) ForearmC();
        } else {
            ForearmC();
        }
    }

    if (part == "ForearmD") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) ForearmD();
        } else {
            ForearmD();
        }
    }

    if (part == "ForearmE") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) ForearmE();
        } else {
            ForearmE();
        }
    }

    if (part == "ForearmF") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) ForearmF();
        } else {
            ForearmF();
        }
    }
    
     if (part == "TypeAClosedForearm") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) TypeAClosedForearm();
        } else {
            TypeAClosedForearm();
        }
    }   
   
    if (part == "TypeAForearmStraps") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) TypeAForearmStraps();
        } else {
            TypeAForearmStraps();
        }
    }
    
    if (part == "Palm") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) Palm();
        } else {
            Palm();
        }
    }

    // --- Kinetic Upper Arm ---
    if (part == "UpperArm") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) UpperArmKinetic();
        } else {
            UpperArmKinetic();
        }
    }

    if (part == "UpperArmCover") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) UpperArmCoverKinetic();
        } else {
            UpperArmCoverKinetic();
        }
    }
    
    if (part == "UpperArmCuff") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) UpperArmCuff();
        } else {
            UpperArmCuff();
        }
    }
}


// --- Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm ---
module ForearmA() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type A Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmB() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type B Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmC() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type C Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmD() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type D Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmE() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type E Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmF() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type F Forearm 100%.STL",
               center=true, convexity=3);
}

module TypeAClosedForearm() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Type A Closed Forearm 100.STL",
               center=true, convexity=3);
}

module TypeAForearmStraps() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Type A Forearm 100_ 2 Straps v6.STL",
               center=true, convexity=3);
}

module Palm() {
    scale([ArmCircumferenceScale, ArmCircumferenceScale, ArmScale])
        import("Kinetic Arm STL Files/Lower Components/Non-scalable Components/Palm/Palm RH100%.STL",
               center=true, convexity=3);
}

// --- Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm ---
module UpperArmKinetic() {
    scale([CuffScale, CuffScale, ArmScale])
        import("Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm/Upper Arm 100%.STL",
               center=true, convexity=3);
}
// --- Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm Cover ---
module UpperArmCoverKinetic() {
    scale([CuffScale, CuffScale, ArmScale])
        import("Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm Cover/Upper Arm Cover 100%.STL",
               center=true, convexity=3);
}

module UpperArmCuff() {
    scale([CuffScale, CuffScale, ArmScale])
        import("Upper Arm Cuff 100 1 Strap.STL",
               center=true, convexity=3);
}