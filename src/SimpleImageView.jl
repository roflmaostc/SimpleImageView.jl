module SimpleImageView

using Colors, ImageShow

export simshow

"""
    simshow(arr; set_one=false, set_zero=false,
                f = identity, γ=1)

Displays a real valued array . Brightness encodes magnitude.
Works within Jupyter and Pluto.

# Keyword args
The transforms are applied in that order.

* `set_zero=false` subtracts the minimum to set minimum to 1
* `set_one=false` divides by the maximum to set maximum to 1
* `f` applies an arbitrary function to the abs array
* `γ` applies a gamma correction to the abs 
"""
function simshow(arr::AbstractArray{<:Real}; 
                 set_one=true, set_zero=false,
                 f = identity,
                 γ = 1)
    arr = set_zero ? arr .- minimum(arr) : arr
    arr = set_one ? arr ./ maximum(arr) : arr

    arr = f(arr) 

    if !isone(γ)
        arr .= arr .^ γ
    end

    Gray.(arr)
end


"""
    simshow(arr)

Displays a complex array. Color encodes phase, brightness encodes magnitude.
Works within Jupyter and Pluto.


# Keyword args
The transforms are applied in that order.

* `absf` applies an arbitrary function to the abs array
* `absγ` applies a gamma correction to the abs 
"""
function simshow(arr::AbstractArray{T};
                 absγ=1,
                 absf = identity) where (T<:Complex)
    Tr = real(T)
    # scale abs to 1
    absarr = abs.(arr)
    absarr ./= maximum(absarr)

    absarr .= absf(absarr)
    
    if !isone(absγ)
        absarr .= absarr .^ absγ
    end

    angarr = angle.(arr) ./ Tr(2pi) * 360 

    HSV.(angarr, one(Tr), absarr)
end



"""
    simshow(arr::AbstractArray{<:Colors.ColorTypes.Colorant})

If `simshow` receives an array which already contains color information, just display it.
"""
function simshow(arr::AbstractArray{<:Colors.ColorTypes.Colorant})
    return arr
end





end # module SimpleImageView
