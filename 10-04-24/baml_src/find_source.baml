// Some function that can determine where the source of this news media is.
enum Source {
    CNN
    FoxNews
    BBC
    Reddit
    Twitter
    Facebook
    Other
}

function IdentifySource(content: string | image) -> Source {
    client Openai
    prompt #"
        Identify where this article is from.
        
        {{ ctx.output_format }}

        {{ _.role('user') }}
        {{ content }}
    "#
}

class Fact {
   citation string[] @alias(sections) @description(#"
    Extact text from the article that supports this fact
   "#)
   summary string @alias(fact)
}

class Quote {
    speaker string
    content string
}

class Response {
  quotes Quote[]
  facts Fact[]
}

function ExtractFacts(content: string | image) -> Response {
    client "openai/gpt-4o"
    prompt #"
        Find all the facts in this article.
        
        {{ ctx.output_format }}

        {{ _.role('user') }}
        {{ content }}
    "#
}

test img {
  functions [IdentifySource, ExtractFacts]
  args {
    content {
      file "../tests/bbc1.png"
    }
  }
}

test cnn {
  functions [IdentifySource, ExtractFacts]
  args {
    content #"
Jan. 6 thrust back into the spotlight in final election days
Stephen Collinson
Analysis by Stephen Collinson, CNN
 9 minute read 
Updated 7:34 AM EDT, Fri October 4, 2024




20241002-roy_wood walz split_full16x9.jpg
'JD Vance did something astonishing': Comedian Roy Wood Jr. reacts to VP debate
02:15
20241002-pelosi_vance split vpx_full16x9.jpg
Vance says GOP needs to regain Americans' trust on abortion. Pelosi responds
03:06
20241002-vance-luntz-walz_split.jpg
Frank Luntz says a group of undecided voters had an overwhelming change after the VP debate
03:04
still_21012961_27782.050000000003_still.jpg
'Petty, vindictive, and cruel': Cheney slams Trump during appearance with Harris
01:22
judge tina peters.jpg
‘You are a charlatan’: Judge blasts former Colorado county clerk Tina Peters at sentencing
04:32
20241004-biden_harris helene.jpg
‘This is FALSE’: White House responds to Trump’s FEMA disaster relief claims
02:05
trump cheney fox.jpg
Liz Cheney blasted Trump at a Harris event. He responded on Fox News
01:14
still_21001801_978823.831_still.jpg
Melania Trump says she told husband family separations needed to stop. Hear Omarosa's reaction
01:43
still_20995875_2059543.2770000002_still.jpg
Why this former Trump White House aide is endorsing Harris
04:32
Republican Senate candidate for Montana Tim Sheehy walks up to the stage during a rally for Republican presidential nominee, former President Donald Trump at the Brick Breeden Fieldhouse at Montana State University in Bozeman, Montana, on August 9, 2024.
Trump-backed Senate candidate goes to great lengths to dodge CNN reporter
04:10
Former President Donald Trump, left, and former Vice President Mike Pence.
New evidence about Trump’s alleged response when he found out Pence was in danger on Jan. 6
02:36
still_21011341_2448.696_still.jpg
‘Bizarre’: Van Jones reacts to Melania Trump’s new video about abortion
02:36
still_20995615_1370.6670000000001_still.jpg
Why Rudy Giuliani's daughter says she's voting for Kamala Harris
02:35
MILWAUKEE, WISCONSIN - OCTOBER 1: Former President and Republican Presidential nominee Donald Trump speaks at a press conference in the Discovery Center on October 1, 2024 in Milwaukee, Wisconsin. Trump spoke to reporters about citizens being able to choose their own schools and promises he would keep if elected. (Photo by Jim Vondruska/Getty Images)
Trump responds to Jack Smith’s new January 6 case filing
00:31
Special Counsel Jack Smith, left, and Republican presidential nominee, former President Donald Trump
Legal expert says one quote from Jack Smith in filing sums up his case against Trump
02:19
20241002-roy_wood walz split_full16x9.jpg
'JD Vance did something astonishing': Comedian Roy Wood Jr. reacts to VP debate
02:15
20241002-pelosi_vance split vpx_full16x9.jpg
Vance says GOP needs to regain Americans' trust on abortion. Pelosi responds
03:06
20241002-vance-luntz-walz_split.jpg
Frank Luntz says a group of undecided voters had an overwhelming change after the VP debate
03:04
still_21012961_27782.050000000003_still.jpg
'Petty, vindictive, and cruel': Cheney slams Trump during appearance with Harris
01:22
judge tina peters.jpg
‘You are a charlatan’: Judge blasts former Colorado county clerk Tina Peters at sentencing
04:32
20241004-biden_harris helene.jpg
‘This is FALSE’: White House responds to Trump’s FEMA disaster relief claims
02:05
CNN
 — 
Donald Trump’s attempt to unravel American democracy to stay in power four years ago is suddenly back at the epicenter of another election — weeks before the ex-president could pull off a stunning White House comeback.

Special counsel Jack Smith and former Rep. Liz Cheney have thrust the issue of the GOP nominee’s false 2020 fraud claims into the endgame of Trump’s neck-and-neck showdown with Democratic nominee Kamala Harris, while reviving memories of a day that will stain American history.

Appearing with Harris in Wisconsin on Thursday, Cheney presented herself as part of a bipartisan movement to block Trump from the White House. But four years on, the mob assault by Trump supporters on the US Capitol, the ex-president’s attempt to subvert a free and fair vote, and his incessant efforts to fracture trust in the US democratic system may not impede his return to power.

This is a reality that reflects both the divided state of the nation and the GOP’s willingness to prioritize power. But most of all, it’s a testimony to the often-malevolent magnetism that has made Trump a historic and enduring political figure.

Cheney, a hardline conservative, appeared with the vice president in the critical battleground to urge independents and Trump-wary Republicans to vote for the Democrat despite their sharp differences on policy.

“The most conservative of conservative values is fidelity to our Constitution,” Cheney said in Ripon, Wisconsin. “As we meet here today, our republic faces a threat unlike any we have faced before.” She added: “In this election, putting patriotism ahead of partisanship is not an aspiration – it is our duty.”

“What January 6 shows us is that there is not an ounce, not an ounce of compassion in Donald Trump. He is petty, he is vindictive, and he is cruel, and Donald Trump is not fit to lead this good and great nation.”

It was a remarkable scene, which was only made possible by the political earthquake unleashed by Trump’s conduct four years ago. A sign of how much things have changed in American politics: Cheney’s father, former vice president Dick Cheney — who was reviled by Democrats, especially over the Iraq War — has also endorsed Harris. His daughter declared: “I have never voted for a Democrat, but this year I am proudly casting my vote for Vice President Kamala Harris.”

The former Wyoming congresswoman lost her leadership position in the House GOP and eventually her seat in a landslide to a primary challenger, after standing up to Trump’s attempt to defy the will of voters in 2020. And while she was still in the House, she helped lead a bipartisan special committee that recommended criminal charges for the twice-impeached ex-president over the January 6, 2021, riot. In Wisconsin, a state that could be decided by narrow margins next month, Cheney could have a big impact if she’s able to move even a few hundred votes.

Next week, Cheney and former Trump White House aides Alyssa Farah Griffin, Cassidy Hutchinson and Sarah Matthews will make the case against Trump in a fireside chat in Montgomery County, Pennsylvania, CNN has exclusively learned.


Why this former Trump White House aide is endorsing Harris
04:32 - Source: CNN
Harris on Thursday praised Cheney’s courage — and vowed, “Anyone who has called for, I quote, the termination of the Constitution of the United States, as Donald Trump has, must never again stand, never again stand behind the seal of the president of the United States.”

The ex-president responded to Cheney’s appearance with a post on his Truth Social network that was filled with personal insults. But Trump’s comments also underscored the populist transformation of the Republican Party that he wrought after more than a decade of draining overseas wars that put a heavy burden on service personnel from many of the heartland states where he draws his strongest support. The Republican nominee blasted Cheney as a war hawk and slammed her father as the leader of “our ridiculous journey into the Middle East, where Trillions of Dollars were spent, millions of people were killed - and for what? Nothing!”

How relatively small numbers of up-for-grabs swing state voters process the issues behind the comments by Cheney and Trump — and weigh them in relation to other top concerns like the economy and high grocery prices — could factor into the wider question of who wins the election.

Cheney’s appearance came after Smith was back in the spotlight Wednesday, with an unsealed court filing offering the most detailed view yet of his federal election interference case against Trump, who has thwarted attempts to bring him to trial before the election.

The special counsel alleged that Trump told family members, “It doesn’t matter if you won or lost the election. You still have to fight like hell.” The filing represents an attempt by Smith to save a case that was seriously damaged by the conservative majority on the Supreme Court, which granted Trump and other ex-presidents wide immunity for acts in office.

Uncertain political fallout from the new focus on January 6
New focus on Trump’s refusal to accept the result of the last election and the January 6 attack on the Capitol might seem like a political disaster for the ex-president. But it’s a mark of Trump’s success in rewriting history that this is not necessarily an election-defining issue.

When Trump left Washington in January 2021, without attending Joe Biden’s inauguration and with the city divided by iron security fences, it would have been absurd to think that he could have a strong chance of returning to power in a non-consecutive second term.

His prospects next month show that while he horrifies many Americans, his conduct after the last election is not seen as disqualifying by millions of others. Trump has countered claims by opponents that he represents a grave peril to the Constitution by arguing that Biden and Harris are the real threat and has blamed their rhetoric for two assassination attempts against him. “I probably took a bullet to the head because of the things that they say about me,” Trump said at his debate with Harris last month. “They talk about democracy. I’m a threat to democracy. They’re the threat to democracy.”


Hear Trump’s response after Harris said he’s a threat to democracy
00:46 - Source: CNN
Trump’s hold on the Republican base has also allowed him to browbeat most party leaders into supporting him and joining his effort to whitewash his conduct after the last election. He’s also again raising doubts about the integrity of the election system as early voting begins this year to hedge against another possible defeat.

Trump’s success in convincing Republicans that he was the victim of political persecution helped him sail through the Republican primary. And the prospect of another Democratic president is even papering over some of the deepest Republican scars remaining from 2020. On Friday, for instance, the ex-president is set to appear with Georgia Gov. Brian Kemp in the swing state for a briefing on Hurricane Helene. Trump has spent years vilifying Kemp for failing to join his attempt to overturn Biden’s win there.

New fears that Trump threatens democracy
The possibility of a Trump return to power is especially ominous for many Americans because he has vowed to wage a second term of “retribution” and is threatening to jail his political opponents.

Yet Trump’s strongman instincts are exactly what makes him attractive to many Republican voters whom he has convinced the Biden administration has weaponized justice against him. There is no evidence to support Trump’s claims, even if some of the prosecutors in several of his criminal and civil cases, notably in Georgia and New York, were political figures who previously criticized the former president. Still, all of Trump’s criminal charges emerged from grand juries or genuine legal processes. And he was judged by a jury of his peers, like any other citizen, when convicted in a Manhattan trial arising from a hush money payment to an adult film actress.

As well as the federal election case, the ex-president is facing a similar one in Georgia based on racketeering statutes. A Trump-appointed judge threw out another Smith prosecution — over Trump’s handling of classified documents at his Florida club — although the special counsel is appealing her decision.

Smith details a devastating story – but Trump has so far forestalled a trial
In his latest filing to district court in Washington, Smith accused the ex-president of trying to overturn legitimate election results in seven states that he lost. The former president, who has pleaded not guilty in this and all criminal cases against him, is entitled to the presumption of innocence.


Legal expert says one quote from Jack Smith in filing sums up his case against Trump
02:19 - Source: CNN
In such a toxic political environment, the special counsel was bound to encounter claims he was motivated by partisanship since, despite his nominal independence, he operates under the auspices of Biden’s Attorney General Merrick Garland. But a failure to prosecute the ex-president, who escaped political accountability when Republican senators declined to convict him in his second impeachment trial, would have created a precedent that might convince a future president to try to ignore an election loss.

While Smith must still convince a jury that Trump broke the law, the historic facts are not in dispute.

The former president refused to accept the result of the 2020 election that he lost. His cases alleging fraud — often lacking evidence — were thrown out by multiple judges and even by the Supreme Court. He called a crowd to Washington and incited his supporters, who smashed their way into the Capitol and beat up police officers. The former president has hailed those who tried to block the electoral certification as heroes and has pledged to pardon them if he returns to power. His actions did not just represent a threat to the sacred American principle of peaceful transfers of power between presidents. They shattered trust among millions of Americans in the legal and electoral system.

Biden made Trump’s threat to democracy the centerpiece of his now-shelved run for president, warning that his predecessor represents an unprecedented threat to America’s soul. But Harris, while warning of the dangers of Trump, has sought to focus primarily on the generational change she offers.

Her tactics are an acknowledgment that there are many other issues — including high grocery prices, the cost of housing, and the price of childcare — that occupy the minds of voters’ as much as somewhat intangible warnings of democracy on the brink.

In a CNN/SSRS poll in September, about 4 in 10 likely voters said the economy was the most important issue as they choose a candidate. Protecting democracy was second at 21%, immigration was at 12% and abortion was at 11%. Harris’ voters were more likely than others to choose protecting democracy as most important (37%) over the economy (21%).

Therefore, while the scenes on January 6, 2021, were horrifying, four years on they are not the dominant issue.

But if Trump wins, future historians may wonder why a former president who tried to burn down democracy to stay in power was able to use the same system to regain the White House.
    "#
  }
}
