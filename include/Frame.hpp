#ifndef FRAME_HPP
#define FRAME_HPP

class Frame {
public:
	void displayConvert(void) {
		image->displayConvert();
	}

	Image *getImage(void)
	{
		return image;
	}

	int getDelay(void)
	{
		return delay;
	}

	Frame *clone(int type, MBITMAP *clone_from, MBITMAP *clone_to, int x, int y, bool skip_draw);

	Frame(Image *image, int delay);
	/* Image is destroyed
	 */
	~Frame(void);
protected:
	Image *image;
	int delay;
};

#endif

