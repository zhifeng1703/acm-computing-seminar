using LinearAlgebra


function data(x::Float64,RelTol::Float64,exact::Float64;n_Max::Int=30)
    myFactorial=zeros(Int,n_Max);
    myFactorial[1]=2;
    for i=2:30
        myFactorial[i]=myFactorial[i-1]*2*i*(2i-1);
    end
    computed::Float64=0.0;
    an_double=zeros(n_Max);
    n::Int=1
    an_double[n]=1.0;
    computed=Float32(an_double[n]);

    RelError=zeros(Float64,n_Max)
    RelError[1]=abs(computed-exact)/abs(exact);

    while RelError[n]>RelTol
        an_double[n+1]=(-1)^(n)*x^(2n)/myFactorial[n];
        computed=computed+an_double[n+1];
        if n==n_Max
            throw("Error: Reach maximum length of the series!");
        end
        RelError[n+1]=abs(computed-exact)/abs(exact);
        n=n+1
    end

    an_single=zeros(Float32,n);
    for i=1:n
        an_single[i]=an_double[i];
    end
    #=
    temp=zeros(n);
    for i=1:n
        temp[i]=an_single[i];
    end
    exact_truncated=sum(temp);
    =#
    println("n= $(n)")
    println(RelError[1:n]);
    return an_single,computed;
end

function my_sum(data::Array{Float32,1})
    n=length(data);
    result=zeros(Float32,4)
    pos::Float32=0.0;
    nag::Float32=0.0;
    for i=1:n
        result[1]=result[1]+data[i];
        result[2]=result[2]+data[n+1-i];
    end
    for i=1:n
        if data[i]>0
            pos=pos+data[i];
        else
            nag=nag+data[i];
        end
    end
    result[3]=pos+nag;
    pos=0.0;nag=0.0;
    for i=1:n
        if data[n+1-i]>0
            pos=pos+data[n+1-i];
        else
            nag=nag+data[n+1-i];
        end
    end
    result[4]=pos+nag;
    return result
end

function test(x::Float64,RelTol::Float64)
    exact=cos(x);
    an_single,exact_truncated=data(x,RelTol,exact);
    result=my_sum(an_single);

    println(abs.(result.-exact_truncated)/abs(exact_truncated));

    println(abs.(result.-exact)/abs(exact));

    println(abs(exact_truncated-exact)/abs(exact));

    println(an_single)
end

test(1.5708,1e-4)
