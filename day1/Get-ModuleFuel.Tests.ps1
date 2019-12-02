# import Get-ModuleFuel
. '.\Get-ModuleFuel.ps1'

Describe 'Get-ModuleFuel Tests' {

    Context 'Simple Fuel' {
        $TestCases = @(
            @{ 'Mass' = 12; 'Fuel' = 2; TestName = 'Mass of 12, returns 2' },
            @{ 'Mass' = 14; 'Fuel' = 2; TestName = 'Mass of 14, returns 2' },
            @{ 'Mass' = 1969; 'Fuel' = 654; TestName = 'Mass of 1969, returns 654' },
            @{ 'Mass' = 100756; 'Fuel' = 33583; TestName = 'Mass of 100756, returns 33583' }
        )

        It 'Get-ModuleFuel returns the correct fuel required, <TestName>' -TestCases $TestCases {
            param(
                $Mass,
                $Fuel
            )

            Get-ModuleFuel -Mass $Mass | Should -Be $Fuel
        }
    } # end simple fuel test

    Context 'Complex Fuel' {

        $ComplexTestCases =@(
            @{ 'Mass' = 12; 'Fuel' = 2; TestName = 'Mass of 12, returns 2' },
            @{ 'Mass' = 14; 'Fuel' = 2; TestName = 'Mass of 14, returns 2' },
            @{ 'Mass' = 1969; 'Fuel' = 966; TestName = 'Mass of 1969, returns 966' },
            @{ 'Mass' = 100756; 'Fuel' = 50346; TestName = 'Mass of 100756, returns 50346' }
        )

        It 'Get-ModuleFuel -Complex returns the correct fuel required, <TestName>' -TestCases $ComplexTestCases {
            param(
                $Mass,
                $Fuel
            )

            Get-ModuleFuel -Mass $Mass -Complex | Should -Be $Fuel
        }
    } # end complex fuel test

} # end Describe Get-ModuleFuel Tests