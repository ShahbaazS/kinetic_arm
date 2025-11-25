// By Emese Elkind, Shahbaaz Siddiqui, and Raquel Casas from Queen's University
// Above-elbow, 3D printable prosthetic arm

// Preview Each Part
part = "ForearmA"; // [ ForearmA:ForearmA, ForearmB:ForearmB, ForearmC:ForearmC, ForearmD:ForearmD,ForearmE:ForearmE, ForearmF:ForearmF, UpperArm:UpperArm, UpperArmCover:UpperArmCover]

// Choose Left or Right Hand
LeftRight = "Left"; // [Left,Right]
// Wrist to elbow crease (mm)
ArmLength = 282; //[141: 564]
// Circumference of Forearm just below elbow crease (mm)
ForearmCircumference = 271; //[135: 542]
// Automatically calculate Bicep size based on Forearm size to maintain original proportions?
LockBicepToForearmRatio = true;
// Otherwise: Circumference of Bicep (mm)
BicepCircumference = 294; //[147: 588]
// Padding Thickness -inside forearm and cuff (mm)
PaddingThickness = 2; //[0: 10]

// --- 3D Printing Orientation ---
// Rotate the part to lay flat on the bed (X, Y, Z in degrees)
Print_Rotation = [0, 0, 0];

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

CalculatedBicep = LockBicepToForearmRatio 
    ? ForearmCircumference * (BaseBicepCircumference / BaseForearmCircumference) 
    : BicepCircumference;
    
BicepCircumferenceWPadding = ((CalculatedBicep/PI) + 2*PaddingThickness) * PI;
CuffScale                  = BicepCircumferenceWPadding / BaseBicepCircumference;

print_part();

module print_part( ) {
    
    rotate(Print_Rotation) {
        
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




