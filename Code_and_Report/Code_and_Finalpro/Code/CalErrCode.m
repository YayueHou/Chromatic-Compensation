function [numi,numq,erri,errq,xi,xq,relecx_i,relecx_q]=CalErrCode(T_c_x,x_seq_I,x_seq_Q)
global settings; 
    x_i=zeros(1,2048);
    x_q=zeros(1,2048);
    alpha=angle(T_c_x);
    for i=1:2048
      if((alpha(i)<pi/2)&&(alpha(i)>=0))
         x_i(i)=0;
         x_q(i)=0;
      end
      if((alpha(i)<pi)&&(alpha(i)>=pi/2))
         x_i(i)=1;
         x_q(i)=0;
      end
     if((alpha(i)<-pi/2)&&(alpha(i)>=-pi))
         x_i(i)=1;
         x_q(i)=1;
     end
     if((alpha(i)<-0)&&(alpha(i)>=-pi/2))
          x_i(i)=0;
          x_q(i)=1;
     end
    end
    
    
    erri=1;
    errq=1;
    position=1;
    xi=x_i;
    for i=1:2048
       xi = circshift(xi,-1);
       [numi,err]=biterr(xi,x_seq_I,1);
       if(err<erri)
         erri=err;
       end
       if(erri>0.1)
         position=position+1;
       end 
    end
    xi=x_i;
    xi=circshift(xi,-position);
   
    [numi,erri]=biterr(xi,x_seq_I,1);
    position=1;
    xq=x_q;
    for i=1:2048
       xq = circshift(xq,1);
       [numq,err]=biterr(xq,x_seq_Q,1);
       if(err<errq)
         errq=err;
       end
       if(errq>0.1)
         position=position+1;
       end 
    end
    xq=x_q;
    xq = circshift(xq,position);
    [numq,errq]=biterr(xq,x_seq_Q,1);
    relecx_i= ElecPulseShaping(-(2*xi-1),settings.Duty,settings.Roll);
    relecx_q= ElecPulseShaping(-(2*xq-1),settings.Duty,settings.Roll);
end