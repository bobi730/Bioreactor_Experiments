(* ::Package:: *)

(* ::Input:: *)
(*k1=10.5;*)
(*k2=28.6;*)
(*k3=1074;*)
(*k4=675;*)
(*s1in=7.5;*)
(*s2in=75;*)
(*\[Alpha]=0.5;*)
(*m1=1.3; ks1=6.85;*)
(*m2=0.74; ks2=9.64; ki=16;*)
(*\[Mu]1[s_]:=m1*s/(ks1+s);   \[Mu]2[s_]:=m2*s/(ks2+s+(s/ki)^2);  *)
(**)
(*s1m=3.93506;*)
(*s1p=4.23859;*)
(**)
(*um=\[Mu]1[s1m]/\[Alpha]; up=\[Mu]1[s1p]/\[Alpha];*)
(*s2m=Solve[\[Mu]2[c]==\[Alpha]*um,c];*)
(*s2p=Solve[\[Mu]2[d]==\[Alpha]*up,d];*)
(**)
(*smin=k2/k1*s1m+c/.s2m[[1]];*)
(*spl=k2/k1*s1p+d/.s2p[[1]];*)
(*sin=k2/k1*s1in+ s2in;*)
(*xmin=(sin-smin)/(\[Alpha]*k3);xpl=(sin-spl)/(\[Alpha]*k3);xcm=(spl+k3*xpl-smin)/k3;xcp=(smin+k3*xmin-spl)/k3;*)
(*x1min=(s1in-s1m)/(\[Alpha]*k1);x1pl=(s1in-s1p)/(\[Alpha]*k1);x1cm=(s1p+k1*x1pl-s1m)/k1;x1cp=(s1m+k1*x1min-s1p)/k1;*)
(*(*GraphicsRow[{Plot[\[Mu]1[x],{x,0,7.5}],Plot[\[Mu]2[x],{x,0,75},PlotRange\[Rule]All]}]*)*)
(*Lmp1=Graphics[{EdgeForm[Thin],Opacity[0.025],Polygon[{{s1m,x1min},{s1m,x1cm},{s1p,x1pl},{s1p,x1cp}}]}];*)
(**)
(* *)
(*steps =100;*)
(* *)
(**)
(*Lmp=Graphics[{EdgeForm[Thin],Opacity[0.025],Polygon[{{smin,xmin},{smin,xcm},{spl,xpl},{spl,xcp}}]}];*)
(**)
(* *)


(* ::Input:: *)
(* *)
(*s10=RandomReal[7.5];*)
(*x10=RandomReal[15];*)
(*s20=RandomReal[75];*)
(*x20=RandomReal[20];*)
(* *)
(*Plots={};*)
(*Ends={};*)
(**)
(*Plots1={};*)
(*Ends1={};*)
(**)
(*Plots2={};*)
(*Ends2={};*)
(**)
(*For[i=0,i<50,i++,*)
(**)
(*jump=RandomInteger[steps];*)
(*when=RandomReal[{0,steps},jump];*)
(*AppendTo[when,0];*)
(*AppendTo[when,steps];*)
(*where=RandomReal[{um,up},jump+2];*)
(**)
(*points=SortBy[Transpose[{when,where}],First];*)
(*ufun=Interpolation[points,InterpolationOrder->1];*)
(*start=Graphics[{Green,PointSize[0.023],Point[{k2/k1*s10+s20,x20}]}];*)
(*start1=Graphics[{Green,PointSize[0.023],Point[{s10,x10}]}];*)
(**)
(*start2=Graphics[{Green,PointSize[0.023],Point[{s20,x20}]}];*)
(**)
(*{s1sol,x1sol,s2sol,x2sol}=NDSolveValue[{s1'[t]==ufun[t]*(s1in-s1[t])-k1*\[Mu]1[s1[t]]*x1[t],*)
(*										x1'[t]==(\[Mu]1[s1[t]]-\[Alpha]*ufun[t])*x1[t],*)
(*										s2'[t]==ufun[t]*(s2in-s2[t])+k2*\[Mu]1[s1[t]]*x1[t]+-k3*\[Mu]2[s2[t]]*x2[t],*)
(*										x2'[t]==(\[Mu]2[s2[t]]-\[Alpha]*ufun[t])*x2[t],*)
(*										s1[0]==s10,x1[0]==x10,s2[0]==s20,x2[0]==x20},*)
(*						                                      {s1,x1,s2,x2},{t,0,steps}];*)
(*scomp[t_]:=k2/k1*s1sol[t] + s2sol[t];*)
(**)
(*finish=Graphics[{Red,PointSize[0.022],Point[{scomp[steps],x2sol[steps]}]}];*)
(*traj=ParametricPlot[{scomp[t],x2sol[t]},{t,0,steps},PlotStyle->{CMYKColor[1+0.0036i,0.045i,0.15i]}];*)
(*AppendTo[Ends,finish];*)
(**)
(*AppendTo[Plots,Show[start,(*traj,*)finish,Frame->True,PlotRange->{{0,20},{0,75}},AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]]];*)
(**)
(*finish1=Graphics[{Red,PointSize[0.022],Point[{s1sol[steps],x1sol[steps]}]}];*)
(*traj1=ParametricPlot[{s1sol[t],x1sol[t]},{t,0,steps},PlotStyle->{CMYKColor[1+0.0036i,0.045i,0.15i]}];*)
(*AppendTo[Ends1,finish1];*)
(**)
(*AppendTo[Plots1,Show[start1,(*traj1,*)finish1,Frame->True,PlotRange->{{0,2},{0,7.5}},AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]]];*)
(**)
(*finish2=Graphics[{Red,PointSize[0.022],Point[{s2sol[steps],x2sol[steps]}]}];*)
(*traj2=ParametricPlot[{s2sol[t],x2sol[t]},{t,0,steps},PlotStyle->{CMYKColor[1+0.0036i,0.045i,0.15i]}];*)
(*AppendTo[Ends2,finish2];*)
(**)
(*AppendTo[Plots2,Show[(*start2,*)(*traj1,*)finish2,Frame->True,PlotRange->{{0,2},{0,7.5}},AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]]];*)
(**)
(*];*)
(**)
(*A=Labeled[Show[Plots,Frame->True,PlotRange->All,AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]],{"x2","s" },{ Left,Bottom},LabelStyle->Blue];*)
(*B=Labeled[Show[Lmp,Plots,Ends,Frame->True,PlotRange->{{29,38},{0.11,0.121}}*)
(*,AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]],{"x2","s" },{ Left,Bottom},LabelStyle->Blue]*)
(**)
(*A1=Labeled[Show[Plots1,Frame->True,PlotRange->All,AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]],{"x1","s1" },{ Left,Bottom},LabelStyle->Blue];*)
(*B1=Labeled[Show[Lmp1,Plots1,Ends,Frame->True,PlotRange->{{3.9,4.27},{0.6,0.7}}*)
(*,AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]],{"x1","s1" },{ Left,Bottom},LabelStyle->Blue]*)
(**)
(*lineS2m=Graphics[{{Dashed,Green,Opacity[0.5],Thickness[0.005],Line[{{c/.s2m[[1]],0},{c/.s2m[[1]],1}}]},Text["s2-",{c/.s2m[[1]],0}]}];*)
(*lineS2p=Graphics[{{Dashed,Green,Opacity[0.5],Thickness[0.005],Line[{{d/.s2p[[1]],0},{d/.s2p[[1]],1}}]},Text["s2+",{d/.s2p[[1]],0}]}];*)
(*lineBigS2m=Graphics[{{Dashed,Red,Opacity[0.5],Thickness[0.005],Line[{{smin-k2/k1*s1p,0},{smin-k2/k1*s1p,1}}]},Text["s2B-",{smin-s1p,0}]}];*)
(*lineBigS2p=Graphics[{{Dashed,Red,Opacity[0.5],Thickness[0.005],Line[{{spl-k2/k1*s1m,0},{spl-k2/k1*s1m,1}}]},Text["s2B+",{spl-s1m,0}]}];*)
(**)
(*A2=Labeled[Show[Plots2,Frame->True,PlotRange->All,AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]],{"x2","s" },{ Left,Bottom},LabelStyle->Blue];*)
(*B2=Labeled[Show[lineS2m,lineS2p,lineBigS2m,lineBigS2p,Plots2,Ends2,Frame->True,PlotRange->All*)
(*,AspectRatio->1, GridLines->Automatic,GridLinesStyle->Directive[Orange, Dashed,Opacity[0.2]]],{"x2","s2" },{ Left,Bottom},LabelStyle->Blue]*)
(**)
