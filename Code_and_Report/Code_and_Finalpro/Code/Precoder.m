function [Precoded_I,Precoded_Q]=Precoder(data_seq,length_data)
%本函数实现DQPSK的预编码
input_I = data_seq(1:2:length_data);
input_Q = data_seq(2:2:length_data);
%% ================================================================
Precoded_I = zeros(1,length(input_I));
Precoded_Q = zeros(1,length(input_Q));
Precoded_I(1) = input_I(1);
Precoded_Q(1) = input_Q(1);
for k = 2:length(input_I)
    if (input_I(k) == 0) && (input_Q(k) == 0)
        if (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 0;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 0;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 1;
        elseif (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 1;
        end
    elseif ((input_I(k) == 1) && (input_Q(k) == 0))
        if (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 0;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 1;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 1;
        elseif (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 0;
        end
    elseif ((input_I(k) == 1) && (input_Q(k) == 1))
        if (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 1;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 1;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 0;
        elseif (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 0;
        end
    elseif ((input_I(k) == 0) && (input_Q(k) == 1))
        if (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 1;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 0)
            Precoded_I(k) = 0;
            Precoded_Q(k) = 0;
        elseif (Precoded_I(k-1) == 1) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 0;
        elseif (Precoded_I(k-1) == 0) && (Precoded_Q(k-1) == 1)
            Precoded_I(k) = 1;
            Precoded_Q(k) = 1;
        end
    end
end

