
#ifndef XML_HPP
#define XML_HPP


#include "monster2.hpp"


class XMLData {
public:
	std::list<XMLData*> &getNodes(void);
	XMLData* find(std::string name);
	std::string getValue(void);
	void write(std::ofstream& out, int tab);
	void add(XMLData* node);
	std::string getName(void);
	bool getFailed(void);
	XMLData(std::string name, std::string value);
	XMLData(std::string filename, int must_exist = 1);
	~XMLData(void);
private:
	XMLData(std::string name, ALLEGRO_FILE* f);
	std::string readToken(void);
	int get(void);
	void unget(int c);
	void seek(long pos);
	void read();
	std::string getName(std::string token);
	ALLEGRO_FILE* file;
	std::string name;
	std::string value;
	std::list<XMLData*> nodes;
	bool debug;
	int ungot;
	bool ungotReady;
	bool failed;
};


#endif // XML_HPP
