
@precompile_setup begin
    
    @precompile_all_calls begin
        simshow(zeros(Float32, (2,2)))
        simshow(rand(Float64, (2,2)))
        simshow(1im .* ones(Float32, (2,2)))
        simshow(1im .* ones(Float64, (2,2)))
    end
end
