// By Emese Elkind, Shahbaaz Siddiqui, and Raquel Casas from Queen's University
// Above-elbow, 3D printable prosthetic arm

// Preview Each Part
part = "ForearmA"; // [ ForearmA:ForearmA, ForearmB:ForearmB, ForearmC:ForearmC, ForearmD:ForearmD,ForearmE:ForearmE, ForearmF:ForearmF, OriginalCuff:OriginalCuff, UpperArmCover:UpperArmCover, TypeAClosedForearm:TypeAClosedForearm, TypeAForearm2Straps:TypeAForearm2Strap,Palm:Palm, Cuff1Strap:Cuff1Strap]

// Choose Left or Right Hand
LeftRight = "Left"; // [Left,Right]

// Measure the widest part of the patient's elbow (mm)
PatientElbowWidth = 98;
// Wrist to elbow crease (mm)
ArmLength = 282; 

// --- Configuration ---

// If Checkmark, rounds scale to nearest 2.5% exactly. If no checkmark, uses exact values (e.g., 93.4%) for better fit.
UseKineticArmOriginalSizes = true;

// --- 3D Printing Orientation ---
// Rotate the part to lay flat on bed (X, Y, Z in degrees) (e.g. 90 or 180)
Print_Rotation = [0, 0, 0];

/* [Hidden] */

PI = 3.141592653589793238;

// Base Elbow Widths at 100% Scale (Type A=98, B=102, etc.)
BaseWidths = [98, 102, 107, 112, 117, 122];

// Upper Arm Modifiers (Type A=0.95, B=1.0, C=1.05...)
UpperArmRatios = [0.95, 1.00, 1.05, 1.10, 1.15, 1.20];

// Insert Base Sizes (Insert A starts at 90mm width logic roughly, simplified for lookup)
// We calculate Insert based on scale %
InsertLabels = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"];

// --- Helper Functions ---

idx = 
    (PatientElbowWidth < 100)   ? 0 : // < 100 -> Type A (98)
    (PatientElbowWidth < 104.5) ? 1 : // 100-104.5 -> Type B (102)
    (PatientElbowWidth < 109.5) ? 2 : // 104.5-109.5 -> Type C (107)
    (PatientElbowWidth < 114.5) ? 3 : // 109.5-114.5 -> Type D (112)
    (PatientElbowWidth < 119.5) ? 4 : // 114.5-119.5 -> Type E (117)
    5;                                // > 119.5 -> Type F (122)

// These are the "100%" reference values the original arm was designed for.
// If the Kinetic arm uses different base sizes, replace 282 / 271 / 294 with those.
BaseArmLength             = 282;  // mm
RawWidthScale = PatientElbowWidth / BaseWidths[idx];

// Rounds to nearest 0.025 (2.5%)
FinalWidthScale = UseKineticArmOriginalSizes 
    ? round(RawWidthScale / 0.025) * 0.025 
    : RawWidthScale;
    
UpperArmScale = FinalWidthScale * UpperArmRatios[idx];
LengthScale = ArmLength / BaseArmLength;

InsertIndex = round((FinalWidthScale * 100 - 90) / 2.5);
SafeInsertIndex = max(0, min(16, InsertIndex));

// Scale along the arm (wrist → elbow)
ArmScale = ArmLength / BaseArmLength;

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
    
     if (part == "TypeAClosedForearm") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) TypeAClosedForearm();
        } else {
            TypeAClosedForearm();
        }
    }   
   
    if (part == "TypeAForearm2Straps") {
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
    if (part == "OriginalCuff") {
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
    if (part == "Cuff1Strap") {
        if (LeftRight == "Left") {
            mirror([1,0,0]) UpperArmCuff();
        } else {
            UpperArmCuff();
        }
    }
}


// --- Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm ---
module ForearmA() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type A Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmB() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type B Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmC() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type C Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmD() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type D Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmE() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type E Forearm 100%.STL",
               center=true, convexity=3);
}

module ForearmF() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Scalable Components/Forearm/Type F Forearm 100%.STL",
               center=true, convexity=3);
}

module TypeAClosedForearm() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Type A Closed Forearm 100.STL",
               center=true, convexity=3);
}

module TypeAForearmStraps() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Type A Forearm 100_ 2 Straps v6.STL",
               center=true, convexity=3);
}

module Palm() {
    scale([FinalWidthScale, FinalWidthScale, FinalWidthScale])
        import("Kinetic Arm STL Files/Lower Components/Non-scalable Components/Palm/Palm RH100%.STL",
               center=true, convexity=3);
}

// --- Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm ---
module UpperArmKinetic() {
    scale([UpperArmScale, UpperArmScale, LengthScale])
        import("Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm/Upper Arm 100%.STL",
               center=true, convexity=3);
}
// --- Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm Cover ---
module UpperArmCoverKinetic() {
    scale([UpperArmScale, UpperArmScale, LengthScale])
        import("Kinetic Arm STL Files/Upper Components/Scalable Components/Upper Arm Cover/Upper Arm Cover 100%.STL",
               center=true, convexity=3);
}

module UpperArmCuff() {
    scale([UpperArmScale, UpperArmScale, LengthScale])
        import("Kinetic Arm STL Files/Upper Arm Cuff 100 1 Strap.STL",
               center=true, convexity=3);
}