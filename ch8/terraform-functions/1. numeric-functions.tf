locals {

    input_values = [10, 20, -5, -81, 100]

}

output "function-01" {
    value = join(" ", ["FUNCTION NAME: ABS() \n", 
    "abs(-5)  --> ", tostring(abs(-5)), "\n", 
    "abs(100) --> ", tostring(abs(100)),])
}