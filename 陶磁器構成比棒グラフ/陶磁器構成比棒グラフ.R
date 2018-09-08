library(ggplot2)
library(ggthemes)
########考古学のための統計処理〜構成比をグラフ表現する
library(ggplot2)
library(ggthemes)
data<-read.csv("pot2.csv")
data$遺跡名<- factor(data$遺跡名, levels=c("弁天貝塚","穂香川右岸","野付通行屋","白老仙台藩陣屋","館城跡"))





###すべてのデータ
p<-ggplot(data,aes(x=遺跡名,y=点数,fill=器種))+geom_bar(stat="identity",position="fill")+coord_flip()+scale_fill_ptol()
ggsave("03.png", p, family="Japan1GothicBBB",width=6,height=3) 




####カテゴリー減らす

######
食膳具<-subset(data,器種=="碗"|器種=="皿"|器種=="その他の食前具")
貯蔵具<-subset(data,器種=="壺･甕･瓶")
その他<-subset(data,器種=="灯明皿・油注"|器種=="その他"|器種=="すり鉢"|器種=="鍋"|器種=="土瓶")

食膳具$器種名<-"食膳具"
貯蔵具$器種名<-"貯蔵具"
その他$器種名<-"その他"

data2<-rbind(食膳具,貯蔵具,その他)
data2$器種名<-factor(data2$器種名,levels=c("食膳具","貯蔵具","その他"))

p<-ggplot(data2,aes(x=遺跡名,y=点数,fill=器種名))+geom_bar(stat="identity",position="fill")+
coord_flip()+
scale_fill_ptol()+theme_minimal()+
theme(axis.text= element_text(size=7),legend.title = element_text(size=7),legend.text = element_text(size=7),axis.title = element_text(size=7),plot.title= element_text(size=7),strip.text=element_text(size=7))
ggsave("16.pdf", p, family="Japan1GothicBBB",width=4,height=2) 

geom_text(aes(label = format(器種名, big.mark=",", scientific=F)), adj = 0, nudge_y = 5000)+
,legend.position = "none"



######棒グラフ
data$器種<-factor(data$器種,levels=c("碗","皿","その他食膳具","壺･甕･瓶","土瓶","鍋","すり鉢","灯明皿・油注","その他"))
p<-ggplot(data,aes(x=器種,y=点数))+geom_bar(stat="identity")+coord_flip()+facet_grid(~遺跡名,scales="free")+theme_grey(base_size=7)
ggsave("06.png", p, family="Japan1GothicBBB",width=6,height=1) 


すり鉢 その他 その他食膳具 皿 土瓶 灯明q皿・油注 鍋 碗 壺･甕･瓶






<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="クリエイティブ・コモンズ・ライセンス" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />この 記事 は <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">クリエイティブ・コモンズ 表示 4.0 国際 ライセンスの下に提供されています。</a>

