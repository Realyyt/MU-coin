###Abstract:

Objective
This paper aims to investigate the potential benefits and feasibility of implementing a decentralized financial transaction system on the Ethereum blockchain for educational institutions. The primary motivation behind this research is to explore the cost-effectiveness and advantages of transitioning from traditional server-based systems to blockchain technology. Additionally, the study evaluates the advantages of introducing a digital currency (MUCoins) for students, enhancing the control and flexibility over financial transactions on campus.

Methodology
The research involved a comprehensive analysis of the existing financial transaction systems at various universities, such as Harvard University, Stanford University, Columbia University, Duke University, the University of Michigan, and UC Berkeley. These systems served as reference points to understand the diverse needs of educational institutions and to identify opportunities for improvement through blockchain technology. Furthermore, the paper explores the technical aspects of Ethereum smart contracts and their applicability in creating a decentralized financial transaction system. The methodology also involves a cost-benefit analysis, assessing the potential savings through per-transaction payments compared to maintaining servers.

Key Findings
Cost Savings: Transitioning to a decentralized financial transaction system on the Ethereum blockchain could potentially save educational institutions thousands of dollars by eliminating the need for dedicated servers. Instead, they would only incur costs on a per-transaction basis.

Enhanced Student Services: The proposed system allows students to exchange MUCoins, introducing a digital currency not supported by traditional financial systems like meal swipes. This feature enhances the flexibility and convenience of financial transactions for students.

Administrative Control: Educational institutions would have complete control over the creation and management of coins in the system. This control ensures security and regulatory compliance.

Market-Driven Coin Prices: The price of MUCoins can be determined by authoritative addresses, enabling market-driven pricing and potentially introducing opportunities for innovation in campus financial services.

Potential Media Coverage: The implementation of a decentralized financial transaction system on the blockchain could attract media attention, providing universities with an opportunity for positive press coverage.

In conclusion, this research underscores the potential benefits of implementing a blockchain-based financial transaction system in educational institutions, offering cost savings, improved student services, administrative control, and the possibility of market-driven coin prices. This transition has the potential to revolutionize financial transactions on campuses, paving the way for a more efficient and flexible system that benefits both the institution and its students.

## Possible improvements
As of right now, this is a very simple token that is mintable by select authoritative addresses (starting with the contract owner). To make it more standard, it could be an [ERC223 token](https://github.com/Dexaran/ERC223-token-standard).

There is also the question of gas fees. As written, each student would pay for gas fees on each transaction. However, if the contract is updated to use the [Gas Station Network (GSN)](https://www.opengsn.org/), the school (or rather, the original authority) would pay for gas on each transaction. This can be offset by charging a small premium on each token.


### TODO
* Make some graphics for the project. Logo, etc.
* Write tests
