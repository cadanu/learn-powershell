# Calculate-Circle:
# This function accepts either the Radius, Diameter, Circumference or Area of a Circle
# and returns all the dimensions listed above.


Function Calculate-Circle {
    
    # declare function parameters
    Param(
        [Parameter(Mandatory = $True)]# we want to know the units of measurement
        [string]
        $Unit, #unit is mandatory
        [double] 
        $Radius,
        [double] #specifying the data type
        $Diameter,
        [double]
        $Circumference,
        [double]
        $Area
    )

    [double]$PI = [math]::PI #We can use this math function instead of storing in variable
    #$PI = 3.141592653589793238462643383279502884197169399375105820974944592307816406286

    if ($Radius -ne $null) { #if parameter is not empty then do the calculation

        #$Radius = $Radius
        $Diameter = 2 * $Radius
        $Circumference = ("{0:N2}" -f ((2 * $PI) * $Radius)) 
        $Area = ("{0:N2}" -f ($PI * ($Radius * $Radius)))    
        $valueBool = $True

    } elseif ($Diameter -ne $null) {

        $Radius = $Diameter / 2
        #$Diameter = $Diameter
        $Circumference = ("{0:N2}" -f ((2 * $PI) * $Radius)) #we format our floats
        $Area = ("{0:N2}" -f ($PI * ($Radius * $Radius)))    #with the {0:N0} -f
        $valueBool = $True

    } elseif ($Circumference -ne $null) {

        $Radius = $Circumference / 2 * $PI
        $Diameter = 2 * $Radius
        #$Circumference = $Circumference
        $Area = ("{0:N2}" -f ($PI * ($Radius * $Radius)))
        $valueBool = $True

    } elseif ($Area -ne $null) {

        $Radius = [math]::Sqrt($ar / $PI)
        $Diameter = 2 * $Radius
        $Circumference = ("{0:N2}" -f ((2 * $PI) * $Radius))
        #$Area = $Area
        $valueBool = $True #sets value to true i

    } else {
        $valueBool = $false
        return
    }      

    if($valueBool -eq $true) {
        $values = "Radius: $Radius $unit,", "Diameter: $Diameter $unit,", "Circumference: $Circumference $unit,", "Area: $area $unit."
    }

    ""
    "Circle Calculator"
    "_________________"
    ""
    "$values"

} #end of Calculate-Circle function


#Author: GDJ
