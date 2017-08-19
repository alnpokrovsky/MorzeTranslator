#include "translator.h"
#include <QString>
#include <QMap>

const QMap<QString, QString> Translator::_engToMorzeMap = {
    {"A", ".-"},
    {"B", "-..."},
    {"C", "-.-."},
    {"D", "-.."},
    {"E", "."},
    {"F", "..-."},
    {"G", "--."},
    {"H", "...."},
    {"I", ".."},
    {"J", ".---"},
    {"K", "-.-"},
    {"L", ".-.."},
    {"M", "--"},
    {"N", "-."},
    {"O", "---"},
    {"P", ".--."},
    {"Q", "--.-"},
    {"R", ".-."},
    {"S", "..."},
    {"T", "-"},
    {"U", "..-"},
    {"V", "...-"},
    {"W", ".--"},
    {"X", "-..-"},
    {"Y", "-.--"},
    {"Z", "--.."},

    {"1", ".----"},
    {"2", "..---"},
    {"3", "...--"},
    {"4", "....-"},
    {"5", "....."},
    {"6", "-...."},
    {"7", "--..."},
    {"8", "---.."},
    {"9", "----."},
    {"0", "-----"},

    {".", ".-.-.-"},
    {",", "--..--"},
    {"?", "..--.."},
    {"/", "-..-."},
    {"@", ".--.-."},
};

QString Translator::inputValue() const
{
    return input;
}

void Translator::setInputValue(const QString & input)
{
    this->input = input.toUpper();
    result = translate(this->input);

    emit inputValueChanged(this->input);
    emit resultValueChanged(result);
}

QString Translator::resultValue() const
{
    return result;
}

QString Translator::translate(QString &input)
{
    if (isMorze(input))
    {
        return morzeToEng(input);
    }
    else
    {
        return engToMorze(input);
    }
}

QString Translator::engToMorze(QString &eng)
{
    QString morze = "";
    int len = eng.length();
    for (int i = 0; i<len; i++){
        QString alpha = eng.at(i);
        if (alpha==" ")
        {
            morze.append(" ");
        }
        else
        {
            QString tmp = _engToMorzeMap.value(alpha,"");
            if (tmp!=""){
                morze.append(tmp+" ");
            }
        }
    }
    return morze.trimmed();
}

QString Translator::morzeToEng(QString &morze)
{
    QString eng = "";
    for (QString & word : morze.split("  ", QString::SkipEmptyParts))
    {
        for (QString & alpha : word.split(" ", QString::SkipEmptyParts))
            eng.append(_engToMorzeMap.key(alpha, "?"));
        eng.append(" ");
    }
    return eng.trimmed();
}

bool Translator::isMorze(QString &inp)
{
    int len = inp.length();
    for (int i = 0; i<len; i++)
        if (inp.at(i)!="." && inp.at(i)!="-" && inp.at(i)!=" ")
            return false;

    return true;
}
