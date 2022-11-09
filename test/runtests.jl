using Test
using SimpleImageView
using ColorTypes

@testset "Real Arrays" begin

    @test simshow([1, 2, 3, 4]) == ColorTypes.Gray{Float64}[Gray{Float64}(0.25), Gray{Float64}(0.5), Gray{Float64}(0.75), Gray{Float64}(1.0)]
    @test simshow([0.1, 0.1], set_one = true) == ColorTypes.Gray{Float64}[Gray{Float64}(1.0), Gray{Float64}(1.0)]
    @test simshow([0.1, 0.1], set_one = false) == ColorTypes.Gray{Float64}[Gray{Float64}(0.1), Gray{Float64}(0.1)]
    @test simshow([0.1, 0.1], set_one = false) == ColorTypes.Gray{Float64}[Gray{Float64}(0.1), Gray{Float64}(0.1)]
    @test simshow([0.1, -0.1], set_one = true, set_zero = false) == ColorTypes.Gray{Float64}[Gray{Float64}(1.0), Gray{Float64}(-1.0)]
    @test simshow([0.1, -0.1], set_one = true, set_zero = true) == ColorTypes.Gray{Float64}[Gray{Float64}(1.0), Gray{Float64}(0.0)]
    @test simshow([0.1, -0.1], set_one = false, set_zero = true) == ColorTypes.Gray{Float64}[Gray{Float64}(0.2), Gray{Float64}(0.0)]
    @test simshow([0.1, -0.1], set_one = false, set_zero = false) == ColorTypes.Gray{Float64}[Gray{Float64}(0.1), Gray{Float64}(-0.1)]
    @test simshow([0.1, 0], γ = 2, set_one = false) == ColorTypes.Gray{Float64}[Gray{Float64}(0.010000000000000002), Gray{Float64}(0.0)]
    @test simshow([0.1, 0], f = (x-> zeros((2,))), set_one = false) == ColorTypes.Gray{Float64}[Gray{Float64}(0.0), Gray{Float64}(0.0)]
end


@testset "Complex Arrays" begin
    @test simshow([1.0, 1im, -1, -1im, 1.0 - 0.0001im]) == ColorTypes.HSV{Float64}[HSV{Float64}(0.0,1.0,0.999999995), HSV{Float64}(90.0,1.0,0.999999995), HSV{Float64}(180.0,1.0,0.999999995), HSV{Float64}(-90.0,1.0,0.999999995), HSV{Float64}(-0.00572957793220964,1.0,1.0)]

    @test simshow([1.0 / 2, (1im) / 2, -1 / 2, (-1im) / 2, 1.0 - 0.0001im], absγ = 2) == ColorTypes.HSV{Float64}[HSV{Float64}(0.0,1.0,0.24999999750000002), HSV{Float64}(90.0,1.0,0.24999999750000002), HSV{Float64}(180.0,1.0,0.24999999750000002), HSV{Float64}(-90.0,1.0,0.24999999750000002), HSV{Float64}(-0.00572957793220964,1.0,1.0)]


    @test simshow([1.0, (1im) / 4, -1 / 8, (-1im) / 2, 1.0 - 0.0001im], absf = (x->begin
                y = copy(x)
                y .= x[1]
                y
            end)) == ColorTypes.HSV{Float64}[HSV{Float64}(0.0,1.0,0.999999995), HSV{Float64}(90.0,1.0,0.999999995), HSV{Float64}(180.0,1.0,0.999999995), HSV{Float64}(-90.0,1.0,0.999999995), HSV{Float64}(-0.00572957793220964,1.0,0.999999995)]

end

@testset "Colorant Array" begin
    @test simshow(ColorTypes.Gray.([0.123])) == ColorTypes.Gray{Float64}[Gray{Float64}(0.123)]

end