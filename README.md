# RotorAS-2D（ 2D 流体模拟-数值模拟）

RotorAS-2D (all speed) ，版本号：1.2.3。

包含以下功能：

1. `前处理`——结构网格生成、非结构网格生成以及混合网格生成；
>>结构网格：代数法法向推进，泊松方程光顺；非结构网格：阵面推进法。

2. `求解器`——基于密度，可用于全速域流场求解计算；
>>空间离散：JST格式、Roe格式；时间离散：统一采用双时间步法，隐式推进；离散方程组求解方法：LU-SGS。
>>湍流模型：SA 和 k-omg SST。
>>不可压缩计算采用预处理技术，动态计算采用动网格技术。

3. `后处理`——压力分布和力（矩）系数或者迟滞回线计算；

PS： 此部分为软件GUI设计部分， 用到3个库：gridLib  flowLib  postLib，
     其源码并没有放出来。
     
`展示：`</br>
`2D` </br>
[Pressure Distribution of Dynamic Stall in Reverse Flow](http://v.youku.com/v_show/id_XMTYxOTU0MzQ5Mg==.html)</br>
[Kármán Vortex Street after Aerodynamic Trailing Edge](http://v.youku.com/v_show/id_XMTYxOTU0MzgyNA==.html)</br>
[Structured Grid Generation around NACA0012](http://v.youku.com/v_show/id_XMTYxOTU0NDUzMg==.html)</br>
[Unstructured Grid Generation outside Structured Grid](http://v.youku.com/v_show/id_XMTYxOTU0NDc2OA==.html)
</br>`3D`</br>
[The Curl Distribution in Rotor Wake](http://v.youku.com/v_show/id_XMTY0NzM1MDQyMA==.html)
     
`算例：`[翼型动态绕流中的有趣现象]( http://cfder.club/2015/12/07/%E7%BF%BC%E5%9E%8B%E5%8A%A8%E6%80%81%E7%BB%95%E6%B5%81%E4%B8%AD%E7%9A%84%E6%9C%89%E8%B6%A3%E7%8E%B0%E8%B1%A1/) 

`个人网站：`[CFD之旅](http://cfder.club/)

