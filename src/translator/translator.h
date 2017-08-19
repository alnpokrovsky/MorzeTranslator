#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QObject>
#include <QString>
#include <QMap>

class Translator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString inputValue READ inputValue
                                  WRITE setInputValue
                                  NOTIFY inputValueChanged )
    Q_PROPERTY(QString resultValue READ resultValue
                                   NOTIFY resultValueChanged)
public:
    Translator(QObject *parent = nullptr) : QObject(parent) {;}
    QString inputValue() const;
    void setInputValue(const QString &);
    QString resultValue() const;



protected:
    QString translate(QString & input);
    QString engToMorze(QString & eng);
    QString morzeToEng(QString & morze);
    bool isMorze(QString & inp);

private:

    QString input = "";
    QString result = "";

    static const QMap<QString, QString> _engToMorzeMap;
    //static const QMap<QString, QString> _morzeToEngMap;

signals:
    void inputValueChanged(QString);
    void resultValueChanged(QString);

public slots:
};

#endif // TRANSLATOR_H
